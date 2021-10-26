cmake_minimum_required(VERSION 3.10)
project(ch57x_stdperiph_driver)

if(NOT DEFINED CH57X_LFCLK_SOURCE)
    message(FATAL_ERROR "Error: CH57X_LFCLK_SOURCE not defined.")
endif()

if(NOT DEFINED CH57X_SYSCLK_FREQ)
    message(FATAL_ERROR "Error: CH57X_SYSCLK_FREQ not defined.")
endif()

if(${CH57X_LFCLK_SOURCE} STREQUAL "XT32K")
    set(CH57X_OSC32K "0")
elseif(${CH57X_LFCLK_SOURCE} STREQUAL "INT32K")
    set(CH57X_OSC32K "1")
else()
    message(FATAL_ERROR "Error: Unknown CH57X_LFCLK_SOURCE")
endif()

set(DRIVER_SOURCES
    "src/CH57x_adc.c"
    "src/CH57x_clk.c"
    "src/CH57x_flash.c"
    "src/CH57x_gpio.c"
    "src/CH57x_int.c"
    "src/CH57x_lcd.c"
    "src/CH57x_pwm.c"
    "src/CH57x_pwr.c"
    "src/CH57x_spi0.c"
    "src/CH57x_spi1.c"
    "src/CH57x_sys.c"
    "src/CH57x_timer0.c"
    "src/CH57x_timer1.c"
    "src/CH57x_timer2.c"
    "src/CH57x_timer3.c"
    "src/CH57x_uart0.c"
    "src/CH57x_uart1.c"
    "src/CH57x_uart2.c"
    "src/CH57x_uart3.c"
    "src/CH57x_usbdev.c"
    "src/CH57x_usbhostBase.c"
    "src/CH57x_usbhostClass.c"
    "src/CH579UFI/CH579UFI.c"
)

set(DRIVER_INCLUDES
    "include"
    "CMSIS/Include"
    "lib/include"
)

set(DRIVER_DEFINES
    "-DFREQ_SYS=${CH57X_SYSCLK_FREQ}"
    "-DCLK_OSC32K=${CH57X_OSC32K}"
)

add_library(${PROJECT_NAME} ${DRIVER_SOURCES})
target_include_directories(${PROJECT_NAME} PUBLIC ${DRIVER_INCLUDES})
target_compile_definitions(${PROJECT_NAME} PUBLIC ${DRIVER_DEFINES})
