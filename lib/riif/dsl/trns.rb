module Riif::DSL
  class Trns < Base
    HEADER_COLUMNS = [
      :trnsid,
      :trnstype,
      :date,
      :accnt,
      :name,
      :amount,
      :docnum,
      :addr1,
      :clear,
      :toprint,
      :nameistaxable,
      :addr2,
      :addr3,
      :addr4,
      :terms,
      :class,
      :saddr1,
      :saddr2,
      :saddr3,
      :saddr4,
      :saddr5,
      :duedate,
    ]
    START_COLUMN = 'TRNS'
    END_COLUMN = 'ENDTRNS'

    def headers
      [
        ["!#{START_COLUMN}"].concat(HEADER_COLUMNS.map(&:upcase)),
        ["!SPL"].concat(Spl::HEADER_COLUMNS.map(&:upcase)),
        ["!#{END_COLUMN}"]
      ]
    end

    def rows
      @rows << [END_COLUMN]
    end

    def spl(&block)
      Spl.new.build(&block)[:rows].each do |row|
        @rows << row
      end
    end
  end
end
