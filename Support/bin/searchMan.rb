#!/usr/bin/env ruby18 -wKU

ptrn = ARGF.read

findings = Hash.new()

workFolder = "#{ENV['TM_BUNDLE_SUPPORT']}/lib"
docFolder = "#{workFolder}/PraatHelpHTML"

ptrn = ptrn.gsub(/[\r\n]/,'')
ptrn = ptrn.gsub(/([\(\)\{\}\+\-\.\[\]])/, '\\\\\1')

ptrnf = ptrn
ptrnf = ptrnf.gsub(/^\s+/, "")
ptrnf = ptrnf.gsub(/\s+$/, "")
ptrnf = ptrnf.gsub(/^/, "(?i)(_|\\b)")
ptrnf = ptrnf.gsub(/ +/, ".*?_")

fnd = false
lcnt = 0

begin
  reFn = Regexp.compile(ptrnf)
  reD = Regexp.compile("(?i)\\b"+ptrn.gsub(/ +/, '.{1,500}?\\b'))
  File.open("#{workFolder}/man.dat").each do |line|
    d = line.split(/\t/, 2)
    if d[0] =~ reFn
      fn = d[0].gsub(/^.*\//, '').gsub(/___/, '...').gsub(/_/, ' ')
      lcnt += 1
      puts "<a id='lc#{lcnt}' class='aref' href='file://#{docFolder}/#{d[0]}.html' target='content'>#{fn}</a><br>"
      fnd = true
      next
    end
    ds = d[1].scan(reD).size
    if ds > 0
      if findings.has_key?(d[0])
        findings[d[0]] += ds
      else
        findings[d[0]] = ds
      end
    end
  end
  if !fnd && findings.size == 0
    puts "Nothing found"
  else
    findings.sort_by { |n,c| c }.reverse.each do |f,a|
      fn = f.gsub(/^.*\//, '').gsub(/___/, '...')
      fn.gsub!(/_/, ' ')
      lcnt += 1
      puts "<a id='lc#{lcnt}' class='aref' href='file://#{docFolder}/#{f}.html' target='content'>#{fn}</a><br>"
    end
  end
rescue Exception => e
  abort e.to_s
end
