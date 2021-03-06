from flask import Flask, render_template, request, redirect, session
import random
# import time
import datetime

app = Flask(__name__)
app.secret_key = 'ThisIsSecret'
timestamp = datetime.datetime.now()



@app.route('/')
def index():
    
    if session.has_key('count') == False:
        session['count'] += 0
    else:
        session['count'] -= 0
    session['farm'] = random.randrange(10,20)
    session['cave'] = random.randrange(5,10)
    session['house'] = random.randrange(2,5)
    session['casino'] = random.randrange(0,50)

    return render_template("index.html", count=session['count'])

@app.route('/process_money', methods=['POST'])
def moneygains():
    session['count'] += session['farm']
    print ('earned '+str(session['farm'])+' from the farm!')
    print st
    session['count'] += session['cave']
    print ('earned '+str(session['cave'])+' from the cave')
    session['count'] += session['house']
    print ('earned '+str(session['house'])+' from the house!')
    if session['count'] < session['casino']:
        session['count'] += session['casino']
        print ('earned '+str(session['casino'])+' from the casino!' + str(timestamp = datetime.datetime.now()))
    else:
        session['count'] -= session['casino'] 
        print ('loss '+str(session['casino'])+' from the casino!')
    
    print session['count']

    return redirect('/', count=session['count'])

@app.route('/reset', methods=['POST'])
def reset():
    session['count'] = 0
    session.pop('farm')
    session.pop('cave')
    session.pop('house')
    session.pop('casino')
    print session['count']
    return redirect('/', count=session['count'])


app.run(debug=True) 