from selenium import webdriver
from selenium.webdriver.support.ui import Select
from firebase import firebase
import time

# firebase init
firebase = firebase.FirebaseApplication('https://leetcodereader.firebaseio.com/', None)
# TODO: need auth for firebase
#

# create or append to a log file
log = open("log.txt", "a")
log.write('LOCAL TIME: ------ ' + time.asctime(time.localtime()) + ' ------ \n')
log.write('\n')

# web driver init
driver = webdriver.Chrome()
driver_des = webdriver.Chrome()
# driver_solv = webdriver.Chrome()
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
    description = "hola this is the description for the problem"
    solutions = {}
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
            if id <= 272:
                break
        elif i == 3:
            title = str(td.get_attribute('value'))
            # to get problem_link
            problem_link = str(td.find_element_by_tag_name('div').find_element_by_tag_name('a').get_attribute('href'))
            # open the problem description link
            driver_des.get(problem_link + '/#/description')
            driver_des.implicitly_wait(3)
            #
            # TODO: obtain the description of the problem, in the format of HTML
            try:
                description = driver_des.find_element_by_class_name('question-content').get_attribute('innerHTML')
            except Exception:
                print('ATTENTION ===>>>' + str(id) + ' problem description not found, please manually update it later.')
                log.write(
                    'ATTENTION ===>>>' + str(id) + ' problem description not found, please manually update it later.\n')
            # print(description)
            # done obtaining
            #
            # open the peoblem solution link
            driver_des.get(problem_link + '/#/solutions')
            driver_des.implicitly_wait(5)
            #
            # TODO: obtain the solutions of the problem, normally 3 items, also in the format of HTML
            pre_solutions = driver_des.find_elements_by_class_name('list-group-item')
            count = len(pre_solutions)
            j = 0
            while j < count:
                # print(j + 1)
                solution_title = pre_solutions[j].text.split("\n")[1]
                pre_solutions[j].click()
            # obtain the solution
                try:
                    solution = driver_des.find_element_by_class_name('panel-body').get_attribute('innerHTML')
                # print(solution)
                    solutions[j] = solution_title + "FORSPLITROF" + solution
                except Exception:
                    print('ATTENTION ===>>>' + str(id) + ' problem solutions not found, please manually update it later.')
                    log.write('ATTENTION ===>>>' + str(id) + ' problem solutions not found, please manually update it later.\n')
            # end
            # go back to solution page
                driver_des.get(problem_link + '/#/solutions')
                driver_des.implicitly_wait(5)
                pre_solutions = driver_des.find_elements_by_class_name('list-group-item')
                count = len(pre_solutions)
                j += 1
            # done obtaining
            #
        # elif i == 4:
            # try:
            #     editorial_link = str(td.find_element_by_tag_name('a').get_attribute('href'))
            # except Exception:
            #     break
        elif i == 5:
            acceptance = float(td.get_attribute('value'))
        elif i == 6:
            difficulty = td.text
    # print out
    print(str(id) + ' ' + title + ' ' + problem_link + ' editorial_link ' + editorial_link + ' ' + str(acceptance) + ' ' + difficulty)
    log.write(str(id) + ' ' + title + ' ' + problem_link + ' editorial_link ' + editorial_link + ' ' + str(acceptance) + ' ' + difficulty +'\n')
    # record for each problem
    if id <= 272:
        continue
    record = {}
    record['id'] = id
    record['title'] = title
    record['problem_link'] = problem_link
    record['editorial_link'] = editorial_link
    record['acceptance'] = acceptance
    record['difficulty'] = difficulty
    record['description'] = description
    record['solutions'] = solutions
    # upload to firebase
    result = firebase.post('/problems', record)

driver_des.close()
driver.close()
