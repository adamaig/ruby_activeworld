
AW_HEADER = "../lib/Aw.h"
RUBY_AW_ENUMS = "ruby_activeworld_enums.rb"

module RubyActiveworldUtils

  @@ENUMS = {}

  def self.parse_enum(typedefed_as)
    File.open(RUBY_AW_ENUMS, "a") do |rawenum|
      s = File.open(AW_HEADER,"r") {|f| s = f.read}
      s =~ /typedef enum \{([^}]+?)\}\s*#{typedefed_as}\s*\;/m  
      enum_name =  $~.captures[0]

      enum_name = enum_name.split(/,/).reject {|x| x.strip!; x.nil? || x.empty? }.each do |x| 
        x.gsub!(/\/\/.*$/,"")
        x.gsub!(/\/\*.*\*\//,"")
        x.strip!
      end

      @@ENUMS[typedefed_as.to_sym] = {}
      rawenum.write "
  def self.#{typedefed_as.downcase}(v=nil)
    r = v.nil? ? @@ENUMS[:#{typedefed_as}] : @@ENUMS[:#{typedefed_as}][v.to_sym]
    raise \"Unknown AWSDK value '\#{v}'\" if r.nil?
    r
  end
  \# Constants for the enum #{typedefed_as}\n"
      
      next_value = 0
      enum_name.each_with_index do |x,i| 
        vals = x.split("=").each {|v| v.strip!}
        next_value = Integer(vals[1]) if vals[1]
        @@ENUMS[typedefed_as.to_sym][vals[0].to_sym] = next_value

        # define the constant at both the module and application instance levels
        
        rawenum.write "#{"  #{vals[0]} = #{next_value}".ljust(50)}\#original line : #{x}\n"
        next_value += 1
      end
    end
  end
  
  
  def self.dump_enums
    File.open(RUBY_AW_ENUMS, "a") do |rawenum|
      rawenum.write "\n\# This hash provides named access to the enum values if desired\n  @@ENUMS = {\n";
      sorted_keys = @@ENUMS.keys.sort {|a,b| a.to_s <=> b.to_s}
      sorted_keys.each do |key|
        rawenum.write "    :#{key} => {\n"
        @@ENUMS[key].each_pair do |k,v|
          rawenum.write "      :#{k} => #{v},\n"
        end
        rawenum.write sorted_keys.last == key ? "    }\n" :  "    },\n"
      end
      rawenum.write "  }\n";
    end
  end
end

# when this file is loaded this generates all the enum values as constants
s = File.open(AW_HEADER,"r") {|f| s = f.read}
enums = [] 
while(s =~ /typedef enum \{[^}]*\}\s*?([^;]+?)\;/m)
  enums << $~.captures[0].strip 
  s = $~.post_match
end


File.open(RUBY_AW_ENUMS, "w") do |rawenum|
  rawenum.write "class RubyActiveworld\n  def self.enums; @@ENUMS.keys; end;\n"
end

enums.each {|enum| RubyActiveworldUtils.parse_enum(enum)}

RubyActiveworldUtils.dump_enums

File.open(RUBY_AW_ENUMS, "a") do |rawenum|
  rawenum.write "end"
end