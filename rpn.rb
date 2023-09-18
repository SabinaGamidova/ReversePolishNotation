module CalcLogic

  
  OPERATOR_PRIORITY = {
    "+" => 1,
    "-" => 1,
    "*" => 2,
    "/" => 2,
    "^" => 3
  }


  def convert_to_rpn(expression)
    stack = []
    output = []
    num_buffer = ""

    expression.each_char do |char|
      if char =~ /\d/ || char =~ /[a-zA-Z]/
        num_buffer << char
      else
        unless num_buffer.empty?
          output << num_buffer
          num_buffer = ""
        end

        if OPERATOR_PRIORITY.key?(char)
          while !stack.empty? && OPERATOR_PRIORITY.key?(stack.last) &&
                compare_and_return_necessary_key({ stack.last => OPERATOR_PRIORITY[stack.last] }, { char => OPERATOR_PRIORITY[char] }) == stack.last
            output << stack.pop
          end
          stack.push(char)
        elsif char == "("
          stack.push(char)
        elsif char == ")"
          while !stack.empty? && stack.last != "("
            output << stack.pop
          end
          stack.pop if stack.last == "("
        end
      end
    end

    clearing_stack_and_buffer_if_not_empty(stack, output, num_buffer)
    output.join(" ")
  end


  def clearing_stack_and_buffer_if_not_empty(stack, output, buffer)
    unless buffer.empty?
      output << buffer
    end

    while !stack.empty?
      output << stack.pop
    end
  end


  def compare_and_return_necessary_key(first_pair, second_pair)
    first_key = first_pair.keys[0]
    first_value = OPERATOR_PRIORITY[first_key]

    second_key = second_pair.keys[0]
    second_value = OPERATOR_PRIORITY[second_key]

    if first_value > second_value ||
       (first_value == second_value && first_key != "^" && second_key == "^")
      return first_key
    else
      return second_key
    end
  end
end