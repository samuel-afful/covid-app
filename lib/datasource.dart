import 'package:flutter/material.dart';
double textSize = 15;
Color primaryBlack = Color(0xff202c3b);
TextStyle styling = TextStyle(fontWeight: FontWeight.bold,color: Colors.black);
class DataSource {
  //static String qoute = "Be Bold Nothing to be Afraid of, Everything is to be understood. Now is the time to understsand";

  static List questionAnswers = [

    {
      "question":"What is a coronavirus?",
      "answer":"Coronaviruses are a large family of viruses that are known to cause illness ranging from the common cold to more severe diseases such as Middle East Respiratory Syndrome (MERS) and Severe Acute Respiratory Syndrome (SARS)."
    },
     {
      "question":"What is a novel coronavirus?",
      "answer":"A novel coronavirus (CoV) is a new strain of coronavirus that has not been previously identified in humans."
    },
     {
      "question":"Can humans become infected with a novel coronavirus of animal source?",
      "answer":"Detailed investigations found that SARS-CoV was transmitted from civet cats to humans in China in 2002 and MERS-CoV from dromedary camels to humans in Saudi Arabia in 2012. Several known coronaviruses are circulating in animals that have not yet infected humans. As surveillance improves around the world, more coronaviruses are likely to be identified."
    },
     {
      "question":"What are the symptoms of someone infected with a coronavirus?",
      "answer":"It depends on the virus, but common signs include respiratory symptoms, fever, cough, shortness of breath, and breathing difficulties. In more severe cases, infection can cause pneumonia, severe acute respiratory syndrome, kidney failure and even death."
    },
     {
      "question":"Can coronaviruses be transmitted from person to person?",
      "answer":"Yes, some coronaviruses can be transmitted from person to person, usually after close contact with an infected patient, for example, in a household workplace, or health care centre."
    },
     {
      "question":"Is there a vaccine for a novel coronavirus?",
      "answer":"When a disease is new, there is no vaccine until one is developed. It can take a number of years for a new vaccine to be developed."
    },
     {
      "question":"Is there a treatment for a novel coronavirus?",
      "answer":"There is no specific treatment for disease caused by a novel coronavirus. However, many of the symptoms can be treated and therefore treatment based on the patient’s clinical condition. Moreover, supportive care for infected persons can be highly effective."
    },
    {
      "question":"What can I do to protect myself?",
      "answer":"Standard recommendations to reduce exposure to and transmission of a range of illnesses include maintaining basic hand and respiratory hygiene, and safe food practices  and avoiding close contact, when possible, with anyone showing symptoms of respiratory illness such as coughing and sneezing."
    },
    {
      "question":"Are health workers at risk from a novel coronavirus?",
      "answer":"Yes, they can be, as health care workers come into contact with patients more often than the general public WHO recommends that health care workers consistently apply appropriate"
    },
    {
      "question":"What WHO recommendations for countries?",
      "answer":"WHO encourages all countries to enhance their surveillance for severe acute respiratory infections (SARI), to carefully review any unusual patterns of SARI or pneumonia cases and to notify WHO of any suspected or confirmed case of infection with novel coronavirus."
    }

  ];

}