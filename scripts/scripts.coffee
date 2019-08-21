axios = require 'axios'
dotenv = require 'dotenv'
do dotenv.config

# Description:
#   삶의 질을 높여 줄 귀요미 봇입니다.

module.exports = (robot) ->
  # 점수 평균 구하기
  robot.respond /평균\n(.*)/i, (res) ->
    texts = res.match.input
    rows = texts.split("평균")[1].split("\n")[1..]

    scores = rows.map (row) ->
      splited = row.trim("\t").split("\t")
      Number splited[splited.length - 4]
    
    [sum, under_60] = scores.reduce (acc, score) ->
        acc[0] += score
        if score < 60
          acc[1] += 1
        acc
      , [0, 0]

    average = (sum / scores.length).toFixed(2)
    res.reply "(평균 #{average} / 과락자 #{under_60})"
  
  # URL 줄이기
  robot.respond /shorten\n(.*)/i, (res) ->
    texts = res.match.input
    rows = texts.split("shorten")[1].split("\n")[1..]

    { SHORTEN_URL, HUBOT_SLACK_TOKEN } = process.env
    
    author = res.envelope.user.real_name
    body = { originalUrl: rows[0], short: rows[1], author }
    headers = { "Hubot-Slack-Token": HUBOT_SLACK_TOKEN }

    response = axios.post "#{SHORTEN_URL}/shorten", body, { headers }

    response.then ({ data }) ->
      if author == "김선재"
        res.reply "sunjae.kim/" + data.message
      else
        res.reply "tisha.me/" + data.message
    .catch (error) ->
      res.reply error.response.data.message
