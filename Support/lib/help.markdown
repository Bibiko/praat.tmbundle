# Introduction

Praat is an open source software environment for doing phonetics written by Paul Boersma and David Weenink. 
More information about Praat can be found at <http://www.praat.org/>.

<font color=blue> ⇢ This bundle was tested on Praat version 5.4. and TextMate version 2.0-beta.3</font>

# Syntax Highlighting

The implemented syntax highlighting is optimized for the so-called _colon notation_ [<code>end = Get end point: 1, 1</code>] introduced to Praat version 5.3.63 and the _do() notation_ [<code>do ("Get end point", 1, 1)</code>]. The elder _... notation_ is also supported but due to 231 possible argument structures of commands (version 5.4) these arguments are not always parsed correctly.

The syntax highlighting “knows” ca. 2285 distinct script and editor commands (out of ca. 3840 commands based on different objects and parameter structures) plus 264 built-in functions, pre-defined variables, and control elements (based on version 5.4) which makes it possible to use the syntax highlighting as a kind of syntax validator as well. Since it is so far impossible to detect whether a line of code is meant to run as editor or “normal” script command the current syntax highlighting will mark editor commands by shading the background. Please note that there're 45 commands which are both editor and “normal” script commands. In such a case the command keeps unmarked.

# Commands

## Run Selection/Document
<button>&nbsp;&#x2318;R&nbsp;</button>
It executes the current document or selection in a __self-sufficient__ environment via the command-line version of Praat and it displays the output in an HTML window. 

If the script contains a __form__ ... __endform__ declaration a input mask will be displayed before the script will be executed. After pressing <small><button>Run</button></small> the entered parameters will be passed as arguments to the script.

***Remark*** This is __not__ the same as “Run Script” from inside Praat. In order to execute commands in a running Praat session, please use the following command “Send Selection/Line to Praat”.

## Send Selection/Line to Praat
<button>&nbsp;&#x2318;&#x21A9;&nbsp;</button>
It sends the current line or selection via “sendpraat_carbon” which is part of the this bundle (sub-folder <code>Support/bin</code>) to Praat. If Praat is not yet running it will start it.

## Open Selection/Document in Praat
<button>&nbsp;&#x2303;O&nbsp;</button>
This command will save the current document (for a selection or untitled document it saves it as a temporary file) and opens it in Praat as script.

## Search & Insert Command...
<button>&nbsp;&#x2303;⎋&nbsp;</button>
This command opens the “Praat Command Wizard” with which one can search for ca. 3840 commands in various ways, assemble parameters by using the same input form as in Praat if required, and inserts a selected command into the front most TextMate document.

__You can pass an initial search string as follows:__<br>
Type in an emtpy line for instance <span style='background-color:lightgrey;'>` cre sou ton `</span> and press <button>&nbsp;&#x2303;⎋&nbsp;</button>; <span style='background-color:lightgrey;'>` cre sou ton `</span> will be selected and the wizard opens, choose the correct command with the arguments and press <button>Insert Command</button>. The selected <span style='background-color:lightgrey;'>` cre sou ton `</span> will be replaced by the chosen command.

If a line already contains for instance <span style='background-color:lightgrey;'>` a = `</span> you also can type something like <span style='background-color:lightgrey;'>` a = get nu inter `</span> and invoke this command; only <span style='background-color:lightgrey;'>` get nu inter `</span> will be selected and replaced by the chosen command.

Of course, you can also select by yourself an initial search string in beforehand.

<p><b>Keyboard shortcuts</b><br>
	<button>CTRL+F</button> sets the focus to the search input field<br>
	&nbsp;&nbsp;<button>ENTER</button> inside the search input field sets the focus to the table<br>
	<button>CTRL+A</button> inserts the entire Praat command<br>
	&nbsp;&nbsp;<button>ENTER</button> if the table has the focus<br>
	<button>CTRL+U</button> sets the focus to the target menu<br>
	<button>CTRL+Y</button> sets the focus to the first argument of the found command<br>
	<button>CTRL+Z</button> sets the focus to the first visible row of the table<br>
	<button>ARROW-UP/DOWN ~ PAGE UP/DOWN</button> navigates through the table if it's selected
</p>
<p><b>Search Input Field</b><br>
	The string that is entered here will be searched for in the <i>Command</i> and <i>of Object(s)</i> columns, and if a row (command or object) 
	contains the search string  it will be outputted. To look for more than one word or part of a word, simply enter a <code>Space</code> 
	between the search strings. The order of multiple search strings doesn't affect the output.<br>
	The <i>of Object(s)</i> column lists the object type(s) – (if there are more than one they're separated by ".") 
	which the command  can be applied to.
	For instance, the command "Extract all intervals..." can only be executed if a "Sound" and a "TextGrid" object are selected. 
	In order to search for all commands that can be applied to a given object you can use "." to mark the beginning and end of a word (object); 
	".." can be used to look for the absolute beginning and end of the entire column <i>of Object(s)</i>.
	<br>
	<i>Examples</i>:
	<ul>
	<li>to look for "Create Sound" commands</li>
	<code>cre sou</code> or <code>sou cre</code>
	<li>to look for "Get number" commands where at least one of the selected objects is a TextGrid</li>
	<code>get num textgrid</code> or <code>textgrid get num</code>
	<li>get all available commands for a "Sound" object <u>only</u></li>
	<code>..sound..</code>
	<li>get all available commands for a "Sound" object which contain "duration" </li>
	<code>..sound.. dur</code>
	<li>get all commands if at least one "Sound" and one "TextGrid" object are selected</li>
	<code>.textgrid. .sound.</code>
	</ul>
</p>

***Hint*** There's also an online version available <http://www.bibiko.de/praat/wizard> .

## Search Praat Manual...
<button>&nbsp;&#x2303;&#x2325;H&nbsp;</button>

This bundle ships with the entire Praat manual (HTML pages) including images. If you select a chunk of text this selection will be used as initial search string. The list of found help pages is sorted as follows: firstly it lists all pages whose file name contain the search string followed by all pages which contain the search string (the more often it occurs in a page the more higher is the page ranking). If you type more than one word as search string these will be interpret as regular expression à la: `\bSTRING1.{1,500}?\bSTRING2` etc., since the search pages are stored for searching as a plain text file, one line contains one help page.

## Praat Completion
<button>&nbsp;⌘⎋&nbsp;</button>

The completion file contains ca. 3620 commands and built-in functions. It works case-sensitive and not only on the current word. In fact it tries to go back within the current line to find a command or function which should be completed. In other word lines like <span style='background-color:lightgrey;'>`a = Get number of |`</span> or <span style='background-color:lightgrey;'>`a = 2 + arcc|`</span> [| := caret] can be completed.

If you invoke “Praat Completion” inside of a `form...endform` block it only will show you the possible field types like `comment`, `real`, `word` etc.


# Notes

## Indent Selection

Due to the internal structure of the Praat syntax indentations like:
`
optionmenu var1 1
	option option1
	option option2
word var2 Hello
`
or the indentation of a line if it begins with `...` cannot be caught by the underlying syntax grammar, this bundle ships with its own “Indent Selection” command bound to the standard keybinding ⌥⌘[ which firstly indent the selection as usual followed by a correction script in order to get a nice formatted Praat script.

## Symbol List

Each `procedure`, `form`, `beginPause`, and `label` declaration will be listed.

### #pragma mark

Furhtermore you can make usage of the comment lines `#pragma mark -` and `#pragma mark title`, which will be listed in the symbol list as well, to structure the script.

# Main Bundle Maintainer

***Version: 1.0 — Date: Nov 04 2014***

<pre>
-  Hans-Jörg Bibiko&nbsp;&nbsp;<a >mail [at] bibiko.de</a>
</pre>
