# Description:
#   hphk 운영에 도움을 줄 귀요미 봇입니다.

module.exports = (robot) ->
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
