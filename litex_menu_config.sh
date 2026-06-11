#!/bin/bash

HOME_DIR_LITEX_PRJ=""
CPU_TYPE="vexriscv_smp"
CPU_COUNT=1
RENODE_CONV_RESULT="NO "
BUILD_SCRIPT_NAME="vexriscv_smp_sim.py"
####################################################################
prepare_func()
{
    echo " Check liteX binary, renode "
    if [ "$(litex_cli --help)" == "" ]; then
	echo " Error : not found litex ,check location or install please!"
	echo " Github site: https://github.com/enjoy-digital/litex"
	echo "                                      +---------------+
                                      |FPGA toolchains|
                                      +----^-----+----+
                                           |     |
                                        +--+-----v--+
                       +-------+        |           |
                       | Migen +-------->           |
                       +-------+        |           |        Your design
                                        |   LiteX   +---> ready to be used!
                                        |           |
              +----------------------+  |           |
              |LiteX Cores Ecosystem +-->           |
              +----------------------+  +-^-------^-+
               (Eth, SATA, DRAM, USB,     |       |
                PCIe, Video, etc...)      +       +
                                         board   target
                                         file    file
					 "
	exit
    else
        echo " OK : found litex "
	LOCATION_LITEX="$(whereis litex_cli)"
        echo "$LOCATION_LITEX"
	#echo "$HOME is your home dir "
	#echo "making LiteX Project dir for CPU test "
	#echo "sudo mkdir -p ${HOME}/liteX_Prj "
	sleep 1.2
    fi

}
build()
{
    echo "### build() function start "
    if [ $CPU_TYPE == "vexriscv_smp" ]; then
	    ./$BUILD_SCRIPT_NAME  --cpu-count=$CPU_COUNT
    else
	echo " Error : \""$CPU_TYPE\"" no script for build !!"
    fi
}

####################################################################
prepare_func
while true
do
    clear

    echo "================================="
    echo "|      LiteX CPU Test Menu      |"
    echo "================================="
    echo "| 1. CPU Type   : $CPU_TYPE  |"
    echo "| 2. Core Count : $CPU_COUNT             |"
    echo "| 3. RENODE Conversion : $RENODE_CONV_RESULT    |"
    echo "| - - - - - - - - - - - - - - - |"
    echo "| 4. Compile & Simulation       |"
    echo "| 5. RENODE Simulation          |"
    echo "| 0. Exit                       |"
    echo "================================="
    echo "  CPU : $CPU_TYPE  Cores : $CPU_COUNT "
    echo "---------------------------------"

    read -p "Select Menu No: " MENU

    case $MENU in

        1)
            echo ""
            echo "1) vexriscv    "
            echo "2) vexriscv_smp"
            echo "3) naxriscv    "

            read -p "CPU Type : " SEL

            case $SEL in
                1) CPU_TYPE="vexriscv    " ;;
                2) CPU_TYPE="vexriscv_smp" ;;
                3) CPU_TYPE="naxriscv    " ;;
            esac

            if [ "$CPU_TYPE" != "vexriscv_smp" ];then
                if [ "$CPU_COUNT" != "1" ]; then
                    CPU_COUNT=1
                    echo "Core Count Changed to $CPU_COUNT "
	        else 
                    echo "Selected CPU is Not supported SMP "
		fi
                sleep 0.8
                continue
            fi



            ;;
        2)
	    if [ "$CPU_TYPE" != "vexriscv_smp" ];then
		if [ "$CPU_COUNT" != "1" ]; then
		    CPU_COUNT=1
		    echo "Core Count Changed to $CPU_COUNT "
		fi
		echo "Selected CPU is Not supported SMP "
		sleep 0.8
		continue
	    fi
            echo ""
            echo "1) 1 Core"
            echo "2) 2 Core"
            echo "3) 4 Core"
           # echo "4) 8 Core"

            read -p "Core Count : " SEL

            case $SEL in
                1) CPU_COUNT=1 ;;
                2) CPU_COUNT=2 ;;
                3) CPU_COUNT=4 ;;
                #4) CPU_COUNT=8 ;;
            esac
            ;;
        4)
            echo ""
            echo "## Build Start..."
            echo "CPU  : $CPU_TYPE"
            echo "Core : $CPU_COUNT"

	    build

            read -p "Press Enter..."
            ;;
	3)
	    echo ""
            echo "1) 1 YES"
            echo "2) 2 NO"

	    read -p  " RENODE conversion Selection : " SEL
	    case $SEL in
                1) RENODE_CONV_RESULT="YES" ;;
                2) RENODE_CONV_RESULT="NO " ;;
            esac

	    ;;
	5)
	    echo ""
	    ;;

####################### quit case #############################
        0)
	    exit 0
	    ;;
	q)
	    exit 0
	    ;;
	Q)
            exit 0
            ;;
    esac
done
