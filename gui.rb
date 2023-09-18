require 'tk'

require_relative "rpn.rb"
include CalcLogic
 
MAX_INPUT_LENGTH = 36

LICHEN_COLOR = '#5fa196'
DARK_LICHEN_COLOR = '#477870'

MIST_COLOR = '#B9C4C9'
DARK_MIST_COLOR = '#8a9194'

DEEP_WATER_COLOR = '#128277'

LABELS_FONT = TkFont.new(family: 'Century Gothic', size: 15)
BUTTON_FONT = TkFont.new(family: 'Century Gothic', size: 10)


window_width = 450
window_height = 450

root = TkRoot.new do 
    title "Sabina Gamidova CS32" 
    geometry "#{window_width}x#{window_height}"
    background DEEP_WATER_COLOR
    resizable false, false
end


screen_width = root.winfo_screenwidth
screen_height = root.winfo_screenheight


x = screen_width / 3
y = screen_height / 4
root.geometry("+#{x}+#{y}")


label_frame = TkFrame.new(root) do
  pack(side: 'top', fill: 'both', expand: true)
  background DEEP_WATER_COLOR
end


center_frame = TkFrame.new(label_frame) do
  background '#FFFFFF'
  padx 10
  pady 10
end

center_frame.lower

center_frame.place(
  'relx' => 0.5,      
  'rely' => 0.5,      
  'anchor' => 'center',  
  'relwidth' => 0.9,   
  'relheight' => 0.5   
)


def default_label_settings(frame)
  label_variable = TkVariable.new
  label_variable.value = ""

  label = TkLabel.new(frame) do
    textvariable label_variable
    font LABELS_FONT
    background '#FFFFFF'
    pack(side: 'top', pady: 10)
  end

  label.bind("Configure") do
    label.place(
      'relx' => 0.5,
      'rely' => 0.5,
      'anchor' => 'center'
    )
  end

  label_variable
end

input_label = default_label_settings(center_frame)


button_frame = TkFrame.new(root) do
  pack(side: 'bottom', fill: 'both', expand: true)
  background DEEP_WATER_COLOR
end


if !ARGV.empty? && ARGV[0].length < MAX_INPUT_LENGTH && ARGV[0].match?(/\A[\d+\-^\/\*]+\z/)
    input_label.value = ARGV[0]
end


def default_button_settings(frame, text, background, activebackground, row, col, input_label)
  TkButton.new(frame) do
    text text
    command { 
        if(text == "DEL")
            if(!input_label.value.empty?) 
                input_label.value = input_label.value[0...-1]
            end 
        elsif(text == "=")
            input_label.value = CalcLogic.convert_to_rpn(input_label.value)
        elsif(text == "CLR")
            input_label.value = ""
        elsif(input_label.value.length < MAX_INPUT_LENGTH)
            input_label.value = input_label.value << text 
        end 
    }
    grid(row: row, column: col, sticky: 'w', padx: 10, pady: 10)
    borderwidth 4
    relief 'raised' 
    background background
    foreground 'black'
    activebackground activebackground
    font BUTTON_FONT
    width 5
    height 2
  end
end


firstButton = default_button_settings(button_frame, "1", MIST_COLOR, DARK_MIST_COLOR, 0, 1, input_label)
secondButton = default_button_settings(button_frame, "2", MIST_COLOR, DARK_MIST_COLOR, 0, 2, input_label)
thirdButton = default_button_settings(button_frame, "3", MIST_COLOR, DARK_MIST_COLOR, 0, 3, input_label)
forthButton = default_button_settings(button_frame, "4", MIST_COLOR, DARK_MIST_COLOR, 1, 1, input_label)
fifthButton = default_button_settings(button_frame, "5", MIST_COLOR, DARK_MIST_COLOR, 1, 2, input_label)
sixthButton = default_button_settings(button_frame, "6", MIST_COLOR, DARK_MIST_COLOR, 1, 3, input_label)
seventhButton = default_button_settings(button_frame, "7", MIST_COLOR, DARK_MIST_COLOR, 2, 1, input_label)
eighthButton = default_button_settings(button_frame, "8", MIST_COLOR, DARK_MIST_COLOR, 2, 2, input_label)
ninthButton = default_button_settings(button_frame, "9", MIST_COLOR, DARK_MIST_COLOR, 2, 3, input_label)
tenthButton = default_button_settings(button_frame, "0", MIST_COLOR, DARK_MIST_COLOR, 3, 2, input_label)


delete_button = default_button_settings(button_frame, "DEL", LICHEN_COLOR, DARK_LICHEN_COLOR, 0, 5, input_label)
clear_button = default_button_settings(button_frame, "CLR", LICHEN_COLOR, DARK_LICHEN_COLOR, 0, 6, input_label)
pow_button = default_button_settings(button_frame, "^", LICHEN_COLOR, DARK_LICHEN_COLOR, 0, 7, input_label)
left_bracket_button = default_button_settings(button_frame, "(", LICHEN_COLOR, DARK_LICHEN_COLOR, 1, 5, input_label)
right_bracket_button = default_button_settings(button_frame, ")", LICHEN_COLOR, DARK_LICHEN_COLOR, 1, 6, input_label)
div_button = default_button_settings(button_frame, "/", LICHEN_COLOR, DARK_LICHEN_COLOR, 1, 7, input_label)
mult_button = default_button_settings(button_frame, "*", LICHEN_COLOR, DARK_LICHEN_COLOR, 2, 5, input_label)
plus_button = default_button_settings(button_frame, "+", LICHEN_COLOR, DARK_LICHEN_COLOR, 2, 6, input_label)
minus_button = default_button_settings(button_frame, "-", LICHEN_COLOR, DARK_LICHEN_COLOR, 2, 7, input_label)
convert_button = default_button_settings(button_frame, "=", '#b80b2b', '#8E0922', 3, 6, input_label)


Tk.mainloop