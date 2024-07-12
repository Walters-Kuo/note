driver.find_element(By.XPATH, "//div[@class='account']")
driver.find_element(By.CSS_SELECTOR, ".subscribe")
driver.find_element(By.ID, "text").send_keys('TEST_TEXT')

"//div[contains(@class, 'account') and text() = '{login_name}']"
"//div[text()='{login_name}']"
"//*[@class='title' and text() = '聯絡我們']"
assert self.driver.switch_to.alert.text == "確定要登出嗎？"


#run javascript 
driver.execute_script("arguments[0].click();", element)

element.send_keys(Keys.BACK_SPACE)

element = self.driver.find_element(By.ID, "email")

#choose either for or while
def clear_input(self, element): 
    for i in range(len(element.get_attribute("value"))):
        element.send_keys(Keys.BACK_SPACE)
    
    while element.get_attribute("value") != "":
        element.send_keys(Keys.BACKSPACE)
        
    #after performing an action with Selenium's ActionChains, you may need to re-find the element before sending keys to it.
    ActionChains(self.driver)\
                .move_to_element(element)\
                .click()\
                .key_down(self.cmd_ctrl)\
                .send_keys("a")\
                .send_keys(Keys.BACK_SPACE)\
                .perform()