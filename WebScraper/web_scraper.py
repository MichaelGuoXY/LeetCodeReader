from selenium import webdriver
from selenium.webdriver.support.ui import Select
from firebase import firebase

# firebase init
firebase = firebase.FirebaseApplication('https://leetcodereader.firebaseio.com/', None)

# web driver init
driver = webdriver.Chrome()
driver.get("https://leetcode.com/problemset/algorithms/")
# wait for webpage loading completely
driver.implicitly_wait(10)

# select on the drop-down menu to view all the problems in the same page
table = driver.find_element_by_id('question-app').find_element_by_tag_name('table')
select = Select(table.find_element_by_tag_name('select'))
select.select_by_visible_text('all')

# parse every single row in the table and then upload them into the firebase
tbodies = table.find_element_by_tag_name('tbody')
trs = tbodies.find_elements_by_tag_name('tr')

for tr in trs:
    id = -1
    title = 'none title'
    problem_link = 'idk'
    editorial_link = 'idk'
    acceptance = -0.00001
    difficulty = 'Default'
    frequency = 'idk'
    i = 0
    for td in tr.find_elements_by_tag_name('td'):
        i += 1
        # every tr contains 7 tds in total
        # 1 nothing
        # 2 number ID
        # 3 title
        # 4 editorial
        # 5 acceptance
        # 6 difficulty
        # 7 frequency
        if i == 2:
            id = int(td.text)
        elif i == 3:
            title = str(td.get_attribute('value'))
            # to get problem_link
            problem_link = str(td.find_element_by_tag_name('div').find_element_by_tag_name('a').get_attribute('href'))
        # elif i == 4:
            # try:
            #     editorial_link = str(td.find_element_by_tag_name('a').get_attribute('href'))
            # except Exception:
            #     break
        elif i == 5:
            acceptance = float(td.get_attribute('value'))
        elif i == 6:
            difficulty = td.text
    print(str(id) + ' ' + title + ' ' + problem_link + ' editorial_link ' + editorial_link + ' ' + str(acceptance) + ' ' + difficulty)


# result = firebase.post('/users', new_user, {'print': 'pretty'}, {'X_FANCY_HEADER': 'VERY FANCY'})

#driver.close()
