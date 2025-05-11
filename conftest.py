import pytest
from selenium import webdriver
from webdriver_manager.chrome import ChromeDriverManager

@pytest.fixture
def browser():
    driver = webdriver.Chrome(ChromeDriverManager().install())
    driver.get("https://parabank.parasoft.com/parabank/index.htm")
    yield driver
    driver.quit()
