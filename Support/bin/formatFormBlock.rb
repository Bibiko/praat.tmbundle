#!/usr/bin/env ruby18 -wKU

doc = ""
@form = ""

inForm = false
hasComment = false

@tab = "\t"
if ENV["TM_SOFT_TABS"] == "YES"
  @tab = " " * ENV["TM_TAB_SIZE"].to_i
end

def reformatForm
  form1 = ""
  @form.split("\n").each do |line|
    if line =~ /^\s*(comment|(end)?form|beginPause)\b|\bendPause\b/
      form1 += "#{line}\n"
    else
      if line =~ /^\s*$/
        form1 += "\n"
      else
        form1 += "#{@tab}#{line}\n"
      end
    end
  end
  @form = form1
end

STDIN.read.split("\n").each do |line|
  line = line.gsub(/\s+$/, '')
  if line =~ /^\s*(form|beginPause)\b/
    inForm = true
    @form += "#{line}\n"
    next
  end
  if inForm and line =~ /^\s*endform\b|\bendPause\b/
    @form += "#{line}\n"
    if hasComment
      reformatForm
    end
    doc += @form
    @form = ""
    inForm = false
    hasComment = false
    next
  end
  if not inForm
    if line =~ /^\s*$/
      doc += "\n"
    elsif line =~ /^\s*\.\.\./
      doc += "#{@tab}#{line}\n"
    else
      doc += "#{line}\n"
    end
    next
  end
  if line =~ /^\s*(option|button)\b/
    @form += "#{@tab}#{line}\n"
  elsif line =~ /^\s*comment/
    hasComment = true
    @form += "#{line}\n"
  else
    if line =~ /^\s*$/
      @form += "\n"
    else
      @form += "#{line}\n"
    end
  end
end


print doc