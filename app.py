from rasa_sdk import Action
from datetime import datetime

class ActionShowDate(Action):
    def name(self):
        return "action_show_date"

    def run(self, dispatcher, tracker, domain):
        current_date = datetime.now().strftime("%Y-%m-%d")
        dispatcher.utter_message(f"Today's date is {current_date}")
        return []
