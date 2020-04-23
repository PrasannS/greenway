# Copyright 2016 Google Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# [START app]
import logging

# [START imports]
from flask import Flask, render_template, request, jsonify
# [END imports]

# [START create_app]
app = Flask(__name__)
# [END create_app]


# [START
    # [END render_template]
    # 
# [START submitted]
@app.route('/get_ranks', methods=['GET'])
def submitted_form():
    args = request.args
    age = int(args['age'])
    terminality =int( args['terminality'])
    income =int( args['income'])
    funds =int(args['funds'])
    success = int(args['success'])
    cost = int(args['cost'])
    score = 1./((age+.000000001)/10.)
    score+= 1./((terminality+.000000001)/10.)
    score+= 1./((income+.000000001)/10.) 
    score+= 1./(((cost*1.)+.000000001)/((funds*1.)+.000000001))
    score+= 1./(1-(success*0.01))
    return jsonify({'score':score})



@app.errorhandler(500)
def server_error(e):
    # Log the error and stacktrace.
    logging.exception('An error occurred during a request.')
    return 'An internal error occurred.', 500
# [END app]

