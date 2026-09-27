	.include "macro.inc"

	.syntax unified

	thumb_func_start AgbMain
AgbMain: @ 0x08000A50
	sub sp, #0x10
	push {r4, lr}
	add r4, sp, #0x18
	str r4, [sp, #0xc]
	mov r4, pc
	str r4, [sp, #0x14]
	mov r4, fp
	str r4, [sp, #8]
	mov r4, lr
	str r4, [sp, #0x10]
	add r4, sp, #0x14
	mov fp, r4
	sub sp, #4
	movs r0, #0
	str r0, [sp]
	ldr r1, _08000AF8 @ =0x040000D4
	mov r0, sp
	str r0, [r1]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	str r0, [r1, #4]
	ldr r0, _08000AFC @ =0x85001FE0
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	bl sub_080009FC
	ldr r1, _08000B00 @ =0x04000204
	ldr r2, _08000B04 @ =0x000045B4
	adds r0, r2, #0
	strh r0, [r1]
	bl IrqInit
	movs r0, #0
	bl SetOnVBlank
	ldr r1, _08000B08 @ =0x04000004
	movs r0, #8
	strh r0, [r1]
	ldr r1, _08000B0C @ =0x04000208
	movs r0, #1
	strh r0, [r1]
	ldr r4, _08000B10 @ =0x08B857F8
	ldr r0, [r4]
	bl InitKeySt
	ldr r0, [r4]
	bl RefreshKeySt
	bl sub_0800427C
	bl sub_0809E404
	bl sub_08004420
	bl sub_08011FAC
	bl sub_0806BA4C
	ldr r0, _08000B14 @ =0x42D690E9
	bl RandInitB
	bl RandNextB
	bl RandInit
	bl sub_0809F924
	bl sub_080BE510
	bl sub_08003F6C
	ldr r0, _08000B18 @ =OnVBlank
	bl SetOnVBlank
	movs r0, #0
	bl SetLang
	bl StartGame
_08000AEE:
	bl RunMainFunc
	bl SoftResetIfKeyCombo
	b _08000AEE
	.align 2, 0
_08000AF8: .4byte 0x040000D4
_08000AFC: .4byte 0x85001FE0
_08000B00: .4byte 0x04000204
_08000B04: .4byte 0x000045B4
_08000B08: .4byte 0x04000004
_08000B0C: .4byte 0x04000208
_08000B10: .4byte 0x08B857F8
_08000B14: .4byte 0x42D690E9
_08000B18: .4byte OnVBlank

	thumb_func_start sub_08000B1C
sub_08000B1C: @ 0x08000B1C
	sub sp, #0x10
	push {r4, lr}
	add r4, sp, #0x18
	str r4, [sp, #0xc]
	mov r4, pc
	str r4, [sp, #0x14]
	mov r4, fp
	str r4, [sp, #8]
	mov r4, lr
	str r4, [sp, #0x10]
	add r4, sp, #0x14
	mov fp, r4
	adds r4, r0, #0
	ldr r1, _08000B50 @ =0x080C57E0
	bl DebugPutStr
	subs r4, #0x40
	ldr r1, _08000B54 @ =0x080C57FC
	adds r0, r4, #0
	bl DebugPutStr
	pop {r4}
	pop {r0, r1, r2}
	mov fp, r1
	mov sp, r2
	bx r0
	.align 2, 0
_08000B50: .4byte 0x080C57E0
_08000B54: .4byte 0x080C57FC

	thumb_func_start IrqInit
IrqInit: @ 0x08000B58
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	movs r0, #0
	str r0, [r7]
_08000B62:
	ldr r0, [r7]
	cmp r0, #0xd
	ble _08000B6A
	b _08000B88
_08000B6A:
	ldr r0, _08000B80 @ =0x030028E0
	ldr r1, [r7]
	adds r2, r1, #0
	lsls r1, r2, #2
	adds r0, r0, r1
	ldr r1, _08000B84 @ =sub_08000BB0
	str r1, [r0]
	ldr r0, [r7]
	adds r1, r0, #1
	str r1, [r7]
	b _08000B62
	.align 2, 0
_08000B80: .4byte 0x030028E0
_08000B84: .4byte sub_08000BB0
_08000B88:
	ldr r0, _08000BA4 @ =IntrMain
	ldr r1, _08000BA8 @ =0x03003950
	movs r2, #0x80
	lsls r2, r2, #2
	bl CpuFastSet
	ldr r0, _08000BAC @ =0x03007FFC
	ldr r1, _08000BA8 @ =0x03003950
	str r1, [r0]
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08000BA4: .4byte IntrMain
_08000BA8: .4byte 0x03003950
_08000BAC: .4byte 0x03007FFC

	thumb_func_start sub_08000BB0
sub_08000BB0: @ 0x08000BB0
	push {r7, lr}
	mov r7, sp
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start SetIrqFunc
SetIrqFunc: @ 0x08000BBC
	push {r7, lr}
	sub sp, #8
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	ldr r0, _08000BDC @ =0x030028E0
	ldr r1, [r7]
	adds r2, r1, #0
	lsls r1, r2, #2
	adds r0, r0, r1
	ldr r1, [r7, #4]
	str r1, [r0]
	add sp, #8
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08000BDC: .4byte 0x030028E0

	thumb_func_start NextRN
NextRN: @ 0x08000BE0
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	adds r0, r7, #0
	ldr r1, _08000C9C @ =0x03000000
	ldrh r2, [r1, #2]
	lsls r1, r2, #0xb
	ldr r2, _08000C9C @ =0x03000000
	ldrh r3, [r2]
	lsrs r2, r3, #5
	adds r1, r1, r2
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, _08000C9C @ =0x03000000
	ldr r1, _08000C9C @ =0x03000000
	ldrh r2, [r1, #4]
	lsls r1, r2, #1
	ldrh r2, [r0, #4]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0, #4]
	ldr r0, _08000C9C @ =0x03000000
	ldrh r1, [r0, #2]
	movs r2, #0x80
	lsls r2, r2, #8
	adds r0, r1, #0
	ands r0, r2
	adds r2, r0, #0
	lsls r1, r2, #0x10
	lsrs r0, r1, #0x10
	cmp r0, #0
	beq _08000C42
	ldr r1, _08000C9C @ =0x03000000
	ldr r0, _08000C9C @ =0x03000000
	ldr r1, _08000C9C @ =0x03000000
	ldrh r2, [r1, #4]
	adds r1, r2, #1
	ldrh r2, [r0, #4]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0, #4]
_08000C42:
	adds r0, r7, #0
	adds r1, r7, #0
	ldr r2, _08000C9C @ =0x03000000
	ldrh r1, [r1]
	ldrh r2, [r2, #4]
	eors r1, r2
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, _08000C9C @ =0x03000000
	ldr r1, _08000C9C @ =0x03000000
	ldrh r2, [r0, #4]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	ldrh r1, [r1, #2]
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0, #4]
	ldr r0, _08000C9C @ =0x03000000
	ldr r1, _08000C9C @ =0x03000000
	ldrh r2, [r0, #2]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	ldrh r1, [r1]
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0, #2]
	ldr r0, _08000C9C @ =0x03000000
	adds r1, r7, #0
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	ldrh r1, [r1]
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
	adds r0, r7, #0
	ldrh r1, [r0]
	adds r0, r1, #0
	b _08000CA0
	.align 2, 0
_08000C9C: .4byte 0x03000000
_08000CA0:
	add sp, #4
	pop {r7}
	pop {r1}
	bx r1

	thumb_func_start RandInit
RandInit: @ 0x08000CA8
	push {r7, lr}
	sub sp, #0x1c
	mov r7, sp
	str r0, [r7]
	adds r0, r7, #4
	adds r1, r7, #4
	ldr r2, _08000D58 @ =0x080C5820
	adds r0, r1, #0
	adds r1, r2, #0
	movs r2, #0x10
	bl memcpy
	ldr r1, [r7]
	adds r0, r1, #0
	movs r1, #7
	bl __modsi3
	str r0, [r7, #0x14]
	ldr r0, _08000D5C @ =0x03000000
	adds r1, r7, #4
	ldr r2, [r7, #0x14]
	movs r3, #7
	ands r2, r3
	adds r3, r2, #0
	lsls r2, r3, #1
	adds r1, r1, r2
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	ldrh r1, [r1]
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
	ldr r0, [r7, #0x14]
	adds r1, r0, #1
	str r1, [r7, #0x14]
	ldr r0, _08000D5C @ =0x03000000
	adds r1, r7, #4
	ldr r2, [r7, #0x14]
	movs r3, #7
	ands r2, r3
	adds r3, r2, #0
	lsls r2, r3, #1
	adds r1, r1, r2
	ldrh r2, [r0, #2]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	ldrh r1, [r1]
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0, #2]
	ldr r0, [r7, #0x14]
	adds r1, r0, #1
	str r1, [r7, #0x14]
	ldr r0, _08000D5C @ =0x03000000
	adds r1, r7, #4
	ldr r2, [r7, #0x14]
	movs r3, #7
	ands r2, r3
	adds r3, r2, #0
	lsls r2, r3, #1
	adds r1, r1, r2
	ldrh r2, [r0, #4]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	ldrh r1, [r1]
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0, #4]
	ldr r1, [r7]
	adds r0, r1, #0
	movs r1, #0x17
	bl __modsi3
	str r0, [r7, #0x18]
	movs r0, #0
	str r0, [r7, #0x14]
_08000D4E:
	ldr r0, [r7, #0x14]
	ldr r1, [r7, #0x18]
	cmp r0, r1
	blt _08000D60
	b _08000D6C
	.align 2, 0
_08000D58: .4byte 0x080C5820
_08000D5C: .4byte 0x03000000
_08000D60:
	bl NextRN
	ldr r0, [r7, #0x14]
	adds r1, r0, #1
	str r1, [r7, #0x14]
	b _08000D4E
_08000D6C:
	add sp, #0x1c
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start RandSetSt
RandSetSt: @ 0x08000D74
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r1, _08000DCC @ =0x03000000
	ldr r0, [r7]
	ldrh r2, [r1]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	ldrh r2, [r0]
	orrs r3, r2
	adds r2, r3, #0
	strh r2, [r1]
	adds r0, #2
	str r0, [r7]
	ldr r1, _08000DCC @ =0x03000000
	ldr r0, [r7]
	ldrh r2, [r1, #2]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	ldrh r2, [r0]
	orrs r3, r2
	adds r2, r3, #0
	strh r2, [r1, #2]
	adds r0, #2
	str r0, [r7]
	ldr r0, _08000DCC @ =0x03000000
	ldr r1, [r7]
	ldrh r2, [r0, #4]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	ldrh r1, [r1]
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0, #4]
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08000DCC: .4byte 0x03000000

	thumb_func_start RandGetSt
RandGetSt: @ 0x08000DD0
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, [r7]
	ldr r1, _08000E00 @ =0x03000000
	ldrh r2, [r1]
	strh r2, [r0]
	adds r0, #2
	str r0, [r7]
	ldr r0, [r7]
	ldr r1, _08000E00 @ =0x03000000
	ldrh r2, [r1, #2]
	strh r2, [r0]
	adds r0, #2
	str r0, [r7]
	ldr r0, [r7]
	ldr r1, _08000E00 @ =0x03000000
	ldrh r2, [r1, #4]
	strh r2, [r0]
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08000E00: .4byte 0x03000000

	thumb_func_start RandNext_100
RandNext_100: @ 0x08000E04
	push {r7, lr}
	mov r7, sp
	bl NextRN
	movs r2, #0x64
	adds r1, r0, #0
	muls r1, r2, r1
	adds r0, r1, #0
	cmp r0, #0
	bge _08000E1C
	ldr r1, _08000E24 @ =0x0000FFFF
	adds r0, r0, r1
_08000E1C:
	asrs r1, r0, #0x10
	adds r0, r1, #0
	b _08000E28
	.align 2, 0
_08000E24: .4byte 0x0000FFFF
_08000E28:
	pop {r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start RandNext
RandNext: @ 0x08000E30
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	bl NextRN
	ldr r2, [r7]
	adds r1, r0, #0
	muls r1, r2, r1
	adds r0, r1, #0
	cmp r0, #0
	bge _08000E4C
	ldr r1, _08000E54 @ =0x0000FFFF
	adds r0, r0, r1
_08000E4C:
	asrs r1, r0, #0x10
	adds r0, r1, #0
	b _08000E58
	.align 2, 0
_08000E54: .4byte 0x0000FFFF
_08000E58:
	add sp, #4
	pop {r7}
	pop {r1}
	bx r1

	thumb_func_start RandRoll
RandRoll: @ 0x08000E60
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	bl RandNext_100
	adds r1, r0, #0
	movs r0, #0
	ldr r2, [r7]
	cmp r2, r1
	ble _08000E78
	movs r0, #1
_08000E78:
	b _08000E7A
_08000E7A:
	add sp, #4
	pop {r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start RandRoll2Rn
RandRoll2Rn: @ 0x08000E84
	push {r7, lr}
	sub sp, #8
	mov r7, sp
	str r0, [r7]
	bl RandNext_100
	str r0, [r7, #4]
	bl RandNext_100
	ldr r1, [r7, #4]
	adds r0, r1, r0
	str r0, [r7, #4]
	ldr r0, [r7, #4]
	asrs r1, r0, #0x1f
	lsrs r2, r1, #0x1f
	adds r1, r0, r2
	asrs r0, r1, #1
	str r0, [r7, #4]
	movs r0, #0
	ldr r1, [r7]
	ldr r2, [r7, #4]
	cmp r1, r2
	ble _08000EB4
	movs r0, #1
_08000EB4:
	b _08000EB6
_08000EB6:
	add sp, #8
	pop {r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start RandInitB
RandInitB: @ 0x08000EC0
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, _08000ED8 @ =0x03000008
	ldr r1, [r7]
	str r1, [r0]
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08000ED8: .4byte 0x03000008

	thumb_func_start RandNextB
RandNextB: @ 0x08000EDC
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	ldr r0, _08000F08 @ =0x03000008
	ldr r1, [r0]
	lsls r0, r1, #2
	adds r1, r0, #2
	str r1, [r7]
	ldr r1, [r7]
	adds r0, r1, #1
	ldr r1, [r7]
	muls r0, r1, r0
	str r0, [r7]
	ldr r0, [r7]
	lsrs r1, r0, #2
	str r1, [r7]
	ldr r0, _08000F08 @ =0x03000008
	ldr r1, [r7]
	str r1, [r0]
	ldr r1, [r7]
	adds r0, r1, #0
	b _08000F0C
	.align 2, 0
_08000F08: .4byte 0x03000008
_08000F0C:
	add sp, #4
	pop {r7}
	pop {r1}
	bx r1

	thumb_func_start GetGameTime
GetGameTime: @ 0x08000F14
	push {r7, lr}
	mov r7, sp
	ldr r0, _08000F20 @ =0x03000010
	ldr r1, [r0]
	adds r0, r1, #0
	b _08000F24
	.align 2, 0
_08000F20: .4byte 0x03000010
_08000F24:
	pop {r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start SetGameTime
SetGameTime: @ 0x08000F2C
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, _08000F44 @ =0x03000010
	ldr r1, [r7]
	str r1, [r0]
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08000F44: .4byte 0x03000010

	thumb_func_start IncGameTime
IncGameTime: @ 0x08000F48
	push {r7, lr}
	mov r7, sp
	ldr r1, _08000F6C @ =0x03000010
	ldr r0, _08000F6C @ =0x03000010
	ldr r1, _08000F6C @ =0x03000010
	ldr r2, [r1]
	adds r1, r2, #1
	str r1, [r0]
	ldr r0, _08000F6C @ =0x03000010
	ldr r1, [r0]
	ldr r0, _08000F70 @ =0x0CDFE5FF
	cmp r1, r0
	bls _08000F78
	ldr r0, _08000F6C @ =0x03000010
	ldr r1, _08000F74 @ =0x0CBEF080
	str r1, [r0]
	b _08000F78
	.align 2, 0
_08000F6C: .4byte 0x03000010
_08000F70: .4byte 0x0CDFE5FF
_08000F74: .4byte 0x0CBEF080
_08000F78:
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start FormatTime
FormatTime: @ 0x08000F80
	push {r4, r7, lr}
	sub sp, #0x10
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
	str r3, [r7, #0xc]
	ldr r4, [r7, #0xc]
	ldr r1, [r7]
	adds r0, r1, #0
	movs r1, #0x3c
	bl __udivsi3
	adds r1, r0, #0
	adds r0, r1, #0
	movs r1, #0x3c
	bl __umodsi3
	adds r1, r0, #0
	strh r1, [r4]
	ldr r4, [r7, #8]
	ldr r1, [r7]
	adds r0, r1, #0
	movs r1, #0xe1
	lsls r1, r1, #4
	bl __udivsi3
	adds r1, r0, #0
	adds r0, r1, #0
	movs r1, #0x3c
	bl __umodsi3
	adds r1, r0, #0
	strh r1, [r4]
	ldr r4, [r7, #4]
	ldr r1, [r7]
	adds r0, r1, #0
	ldr r1, _08000FF0 @ =0x00034BC0
	bl __udivsi3
	adds r1, r0, #0
	strh r1, [r4]
	ldr r1, [r7]
	adds r0, r1, #0
	movs r1, #0x1e
	bl __udivsi3
	adds r1, r0, #0
	movs r2, #1
	adds r0, r1, #0
	ands r0, r2
	adds r1, r0, #0
	lsls r0, r1, #0x18
	asrs r1, r0, #0x18
	adds r0, r1, #0
	b _08000FF4
	.align 2, 0
_08000FF0: .4byte 0x00034BC0
_08000FF4:
	add sp, #0x10
	pop {r4, r7}
	pop {r1}
	bx r1

	thumb_func_start EnableBgSync
EnableBgSync: @ 0x08000FFC
	push {r7, lr}
	mov r7, sp
	ldr r1, _08001014 @ =0x0300000C
	ldr r2, _08001014 @ =0x0300000C
	ldrb r3, [r2]
	adds r2, r0, #0
	orrs r3, r2
	adds r2, r3, #0
	strb r2, [r1]
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08001014: .4byte 0x0300000C

	thumb_func_start sub_08001018
sub_08001018: @ 0x08001018
	push {r4, r7, lr}
	mov r7, sp
	ldr r1, _08001034 @ =0x0300000C
	ldr r2, _08001034 @ =0x0300000C
	movs r4, #1
	adds r3, r4, #0
	lsls r3, r0
	ldrb r2, [r2]
	orrs r2, r3
	adds r3, r2, #0
	strb r3, [r1]
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08001034: .4byte 0x0300000C

	thumb_func_start sub_08001038
sub_08001038: @ 0x08001038
	push {r4, r7, lr}
	mov r7, sp
	ldr r1, _08001058 @ =0x0300000C
	ldr r2, _08001058 @ =0x0300000C
	adds r3, r0, #0
	mvns r4, r3
	ldrb r2, [r2]
	adds r3, r4, #0
	adds r4, r3, #0
	ands r2, r4
	adds r3, r2, #0
	strb r3, [r1]
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08001058: .4byte 0x0300000C

	thumb_func_start EnablePalSync
EnablePalSync: @ 0x0800105C
	push {r7, lr}
	mov r7, sp
	ldr r0, _0800106C @ =0x0300000D
	movs r1, #1
	strb r1, [r0]
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800106C: .4byte 0x0300000D

	thumb_func_start sub_08001070
sub_08001070: @ 0x08001070
	push {r7, lr}
	mov r7, sp
	ldr r0, _08001080 @ =0x0300000D
	movs r1, #0
	strb r1, [r0]
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08001080: .4byte 0x0300000D

	thumb_func_start ApplyPaletteExt
ApplyPaletteExt: @ 0x08001084
	push {r7, lr}
	sub sp, #0xc
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
	ldr r0, [r7, #8]
	movs r1, #0x1f
	ands r0, r1
	cmp r0, #0
	beq _080010C0
	ldr r1, [r7, #4]
	asrs r0, r1, #1
	adds r1, r0, #0
	lsls r0, r1, #1
	ldr r2, _080010BC @ =0x02022860
	adds r1, r0, r2
	ldr r0, [r7, #8]
	asrs r2, r0, #0x1f
	lsrs r3, r2, #0x1f
	adds r2, r0, r3
	asrs r0, r2, #1
	lsls r3, r0, #0xb
	lsrs r2, r3, #0xb
	ldr r0, [r7]
	bl CpuSet
	b _080010E2
	.align 2, 0
_080010BC: .4byte 0x02022860
_080010C0:
	ldr r1, [r7, #4]
	asrs r0, r1, #1
	adds r1, r0, #0
	lsls r0, r1, #1
	ldr r2, _080010F0 @ =0x02022860
	adds r1, r0, r2
	ldr r2, [r7, #8]
	adds r0, r2, #0
	cmp r0, #0
	bge _080010D6
	adds r0, #3
_080010D6:
	asrs r0, r0, #2
	lsls r3, r0, #0xb
	lsrs r2, r3, #0xb
	ldr r0, [r7]
	bl CpuFastSet
_080010E2:
	bl EnablePalSync
	add sp, #0xc
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_080010F0: .4byte 0x02022860

	thumb_func_start sub_080010F4
sub_080010F4: @ 0x080010F4
	push {r4, r7, lr}
	sub sp, #0x1c
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
	str r3, [r7, #0xc]
	ldr r1, [r7, #4]
	asrs r0, r1, #1
	adds r1, r0, #0
	lsls r0, r1, #1
	ldr r1, _08001124 @ =0x02022860
	adds r0, r1, r0
	str r0, [r7, #0x14]
	ldr r0, [r7]
	str r0, [r7, #0x18]
	movs r0, #0
	str r0, [r7, #0x10]
_08001118:
	ldr r0, [r7, #0x10]
	ldr r1, [r7, #8]
	cmp r0, r1
	blt _08001128
	b _080011A2
	.align 2, 0
_08001124: .4byte 0x02022860
_08001128:
	ldr r0, [r7, #0x14]
	ldr r1, [r7, #0x18]
	ldrh r2, [r1]
	movs r3, #0x1f
	adds r1, r2, #0
	ands r1, r3
	adds r3, r1, #0
	lsls r2, r3, #0x10
	lsrs r1, r2, #0x10
	ldr r2, [r7, #0xc]
	muls r1, r2, r1
	asrs r2, r1, #6
	adds r1, r2, #0
	movs r2, #0x1f
	ands r1, r2
	ldr r2, [r7, #0x18]
	ldrh r3, [r2]
	movs r4, #0xf8
	lsls r4, r4, #2
	adds r2, r3, #0
	ands r2, r4
	adds r4, r2, #0
	lsls r3, r4, #0x10
	lsrs r2, r3, #0x10
	ldr r3, [r7, #0xc]
	muls r2, r3, r2
	asrs r3, r2, #6
	adds r2, r3, #0
	movs r3, #0xf8
	lsls r3, r3, #2
	ands r2, r3
	adds r1, r1, r2
	ldr r2, [r7, #0x18]
	ldrh r3, [r2]
	movs r4, #0xf8
	lsls r4, r4, #7
	adds r2, r3, #0
	ands r2, r4
	adds r4, r2, #0
	lsls r3, r4, #0x10
	lsrs r2, r3, #0x10
	ldr r3, [r7, #0xc]
	muls r2, r3, r2
	asrs r3, r2, #6
	adds r2, r3, #0
	movs r3, #0xf8
	lsls r3, r3, #7
	ands r2, r3
	adds r1, r1, r2
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, [r7, #0x14]
	adds r1, r0, #2
	str r1, [r7, #0x14]
	ldr r0, [r7, #0x18]
	adds r1, r0, #2
	str r1, [r7, #0x18]
	ldr r0, [r7, #0x10]
	adds r1, r0, #1
	str r1, [r7, #0x10]
	b _08001118
_080011A2:
	bl EnablePalSync
	add sp, #0x1c
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_080011B0
sub_080011B0: @ 0x080011B0
	push {r7, lr}
	mov r7, sp
	movs r0, #0x80
	lsls r0, r0, #0x13
	ldr r1, _08001284 @ =0x03002870
	ldrh r2, [r1]
	strh r2, [r0]
	ldr r0, _08001288 @ =0x04000004
	ldr r1, _0800128C @ =0x03002874
	ldrh r2, [r1]
	strh r2, [r0]
	ldr r0, _08001290 @ =0x04000008
	ldr r1, _08001294 @ =0x0300287C
	ldrh r2, [r1]
	strh r2, [r0]
	ldr r0, _08001298 @ =0x0400000A
	ldr r1, _0800129C @ =0x03002880
	ldrh r2, [r1]
	strh r2, [r0]
	ldr r0, _080012A0 @ =0x0400000C
	ldr r1, _080012A4 @ =0x03002884
	ldrh r2, [r1]
	strh r2, [r0]
	ldr r0, _080012A8 @ =0x0400000E
	ldr r1, _080012AC @ =0x03002888
	ldrh r2, [r1]
	strh r2, [r0]
	ldr r0, _080012B0 @ =0x04000010
	ldr r1, _080012B4 @ =0x0300288C
	ldr r2, [r1]
	str r2, [r0]
	ldr r0, _080012B8 @ =0x04000014
	ldr r1, _080012BC @ =0x03002890
	ldr r2, [r1]
	str r2, [r0]
	ldr r0, _080012C0 @ =0x04000018
	ldr r1, _080012C4 @ =0x03002894
	ldr r2, [r1]
	str r2, [r0]
	ldr r0, _080012C8 @ =0x0400001C
	ldr r1, _080012CC @ =0x03002898
	ldr r2, [r1]
	str r2, [r0]
	ldr r0, _080012D0 @ =0x04000040
	ldr r1, _080012D4 @ =0x0300289C
	ldr r2, [r1]
	str r2, [r0]
	ldr r0, _080012D8 @ =0x04000044
	ldr r1, _080012DC @ =0x030028A0
	ldr r2, [r1]
	str r2, [r0]
	ldr r0, _080012E0 @ =0x04000048
	ldr r1, _080012E4 @ =0x030028A4
	ldr r2, [r1]
	str r2, [r0]
	ldr r0, _080012E8 @ =0x0400004C
	ldr r1, _080012EC @ =0x030028A8
	ldrh r2, [r1]
	strh r2, [r0]
	ldr r0, _080012F0 @ =0x04000050
	ldr r1, _080012F4 @ =0x030028AC
	ldrh r2, [r1]
	strh r2, [r0]
	ldr r0, _080012F8 @ =0x04000052
	ldr r1, _080012FC @ =0x030028B4
	ldrh r2, [r1]
	strh r2, [r0]
	ldr r0, _08001300 @ =0x04000054
	ldr r1, _08001304 @ =0x030028B6
	ldrb r2, [r1]
	strb r2, [r0]
	ldr r0, _08001308 @ =0x04000020
	ldr r1, _0800130C @ =0x030028B8
	ldr r2, [r1]
	str r2, [r0]
	ldr r0, _08001310 @ =0x04000024
	ldr r1, _08001314 @ =0x030028BC
	ldr r2, [r1]
	str r2, [r0]
	ldr r0, _08001318 @ =0x04000028
	ldr r1, _0800131C @ =0x030028C0
	ldr r2, [r1]
	str r2, [r0]
	ldr r0, _08001320 @ =0x0400002C
	ldr r1, _08001324 @ =0x030028C4
	ldr r2, [r1]
	str r2, [r0]
	ldr r0, _08001328 @ =0x04000030
	ldr r1, _0800132C @ =0x030028C8
	ldr r2, [r1]
	str r2, [r0]
	ldr r0, _08001330 @ =0x04000034
	ldr r1, _08001334 @ =0x030028CC
	ldr r2, [r1]
	str r2, [r0]
	ldr r0, _08001338 @ =0x04000038
	ldr r1, _0800133C @ =0x030028D0
	ldr r2, [r1]
	str r2, [r0]
	ldr r0, _08001340 @ =0x0400003C
	ldr r1, _08001344 @ =0x030028D4
	ldr r2, [r1]
	str r2, [r0]
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08001284: .4byte 0x03002870
_08001288: .4byte 0x04000004
_0800128C: .4byte 0x03002874
_08001290: .4byte 0x04000008
_08001294: .4byte 0x0300287C
_08001298: .4byte 0x0400000A
_0800129C: .4byte 0x03002880
_080012A0: .4byte 0x0400000C
_080012A4: .4byte 0x03002884
_080012A8: .4byte 0x0400000E
_080012AC: .4byte 0x03002888
_080012B0: .4byte 0x04000010
_080012B4: .4byte 0x0300288C
_080012B8: .4byte 0x04000014
_080012BC: .4byte 0x03002890
_080012C0: .4byte 0x04000018
_080012C4: .4byte 0x03002894
_080012C8: .4byte 0x0400001C
_080012CC: .4byte 0x03002898
_080012D0: .4byte 0x04000040
_080012D4: .4byte 0x0300289C
_080012D8: .4byte 0x04000044
_080012DC: .4byte 0x030028A0
_080012E0: .4byte 0x04000048
_080012E4: .4byte 0x030028A4
_080012E8: .4byte 0x0400004C
_080012EC: .4byte 0x030028A8
_080012F0: .4byte 0x04000050
_080012F4: .4byte 0x030028AC
_080012F8: .4byte 0x04000052
_080012FC: .4byte 0x030028B4
_08001300: .4byte 0x04000054
_08001304: .4byte 0x030028B6
_08001308: .4byte 0x04000020
_0800130C: .4byte 0x030028B8
_08001310: .4byte 0x04000024
_08001314: .4byte 0x030028BC
_08001318: .4byte 0x04000028
_0800131C: .4byte 0x030028C0
_08001320: .4byte 0x0400002C
_08001324: .4byte 0x030028C4
_08001328: .4byte 0x04000030
_0800132C: .4byte 0x030028C8
_08001330: .4byte 0x04000034
_08001334: .4byte 0x030028CC
_08001338: .4byte 0x04000038
_0800133C: .4byte 0x030028D0
_08001340: .4byte 0x0400003C
_08001344: .4byte 0x030028D4

	thumb_func_start sub_08001348
sub_08001348: @ 0x08001348
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	adds r1, r7, #0
	strh r0, [r1]
	adds r1, r7, #0
	ldrh r0, [r1]
	cmp r0, #1
	beq _08001378
	cmp r0, #1
	bgt _08001364
	cmp r0, #0
	beq _0800136E
	b _08001390
_08001364:
	cmp r0, #2
	beq _08001380
	cmp r0, #3
	beq _08001388
	b _08001390
_0800136E:
	ldr r0, _08001374 @ =0x0300287C
	b _08001390
	.align 2, 0
_08001374: .4byte 0x0300287C
_08001378:
	ldr r0, _0800137C @ =0x03002880
	b _08001390
	.align 2, 0
_0800137C: .4byte 0x03002880
_08001380:
	ldr r0, _08001384 @ =0x03002884
	b _08001390
	.align 2, 0
_08001384: .4byte 0x03002884
_08001388:
	ldr r0, _0800138C @ =0x03002888
	b _08001390
	.align 2, 0
_0800138C: .4byte 0x03002888
_08001390:
	add sp, #4
	pop {r7}
	pop {r1}
	bx r1

	thumb_func_start GetBgChrOffset
GetBgChrOffset: @ 0x08001398
	push {r7, lr}
	sub sp, #8
	mov r7, sp
	str r0, [r7]
	ldr r1, [r7]
	adds r0, r1, #0
	lsls r2, r0, #0x10
	lsrs r1, r2, #0x10
	adds r0, r1, #0
	bl sub_08001348
	str r0, [r7, #4]
	ldr r0, [r7, #4]
	ldr r1, [r0]
	lsls r0, r1, #0x1c
	lsrs r2, r0, #0x1e
	lsls r1, r2, #0x10
	lsrs r0, r1, #0x10
	adds r1, r0, #0
	lsls r2, r1, #0xe
	adds r0, r2, #0
	b _080013C4
_080013C4:
	add sp, #8
	pop {r7}
	pop {r1}
	bx r1

	thumb_func_start sub_080013CC
sub_080013CC: @ 0x080013CC
	push {r7, lr}
	sub sp, #8
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	ldr r0, [r7, #4]
	lsls r1, r0, #0x10
	lsrs r0, r1, #0x10
	str r0, [r7, #4]
	ldr r0, [r7]
	bl GetBgChrOffset
	ldr r2, [r7, #4]
	subs r1, r2, r0
	adds r0, r1, #0
	cmp r0, #0
	bge _080013F0
	adds r0, #0x1f
_080013F0:
	asrs r1, r0, #5
	adds r0, r1, #0
	b _080013F6
_080013F6:
	add sp, #8
	pop {r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_08001400
sub_08001400: @ 0x08001400
	push {r7, lr}
	sub sp, #8
	mov r7, sp
	str r0, [r7]
	ldr r1, [r7]
	adds r0, r1, #0
	lsls r2, r0, #0x10
	lsrs r1, r2, #0x10
	adds r0, r1, #0
	bl sub_08001348
	str r0, [r7, #4]
	ldr r0, [r7, #4]
	ldr r1, [r0]
	lsls r0, r1, #0x13
	lsrs r2, r0, #0x1b
	lsls r1, r2, #0x10
	lsrs r0, r1, #0x10
	adds r1, r0, #0
	lsls r2, r1, #0xb
	adds r0, r2, #0
	b _0800142C
_0800142C:
	add sp, #8
	pop {r7}
	pop {r1}
	bx r1

	thumb_func_start sub_08001434
sub_08001434: @ 0x08001434
	push {r7, lr}
	sub sp, #0xc
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	ldr r1, [r7]
	adds r0, r1, #0
	lsls r2, r0, #0x10
	lsrs r1, r2, #0x10
	adds r0, r1, #0
	bl sub_08001348
	str r0, [r7, #8]
	ldr r0, [r7, #8]
	ldr r2, [r7, #4]
	asrs r1, r2, #0xe
	adds r2, r1, #0
	movs r3, #3
	adds r1, r2, #0
	ands r1, r3
	adds r2, r1, #0
	lsls r1, r2, #2
	ldrb r2, [r0]
	movs r3, #0xf3
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	add sp, #0xc
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start sub_08001478
sub_08001478: @ 0x08001478
	push {r7, lr}
	sub sp, #0xc
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	ldr r1, [r7]
	adds r0, r1, #0
	lsls r2, r0, #0x10
	lsrs r1, r2, #0x10
	adds r0, r1, #0
	bl sub_08001348
	str r0, [r7, #8]
	ldr r0, [r7, #4]
	lsls r1, r0, #0x15
	lsrs r0, r1, #0x15
	cmp r0, #0
	beq _0800149E
	b _080014D0
_0800149E:
	ldr r0, [r7, #8]
	ldr r2, [r7, #4]
	asrs r1, r2, #0xb
	adds r2, r1, #0
	movs r3, #0x1f
	adds r1, r2, #0
	ands r1, r3
	ldrb r2, [r0, #1]
	movs r3, #0xe0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0, #1]
	ldr r0, _080014D8 @ =0x02024C60
	ldr r1, [r7]
	adds r2, r1, #0
	lsls r1, r2, #2
	adds r0, r0, r1
	ldr r1, [r7, #4]
	movs r2, #0xc0
	lsls r2, r2, #0x13
	orrs r1, r2
	str r1, [r0]
_080014D0:
	add sp, #0xc
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_080014D8: .4byte 0x02024C60

	thumb_func_start sub_080014DC
sub_080014DC: @ 0x080014DC
	push {r7, lr}
	sub sp, #0xc
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	ldr r1, [r7]
	adds r0, r1, #0
	lsls r2, r0, #0x10
	lsrs r1, r2, #0x10
	adds r0, r1, #0
	bl sub_08001348
	str r0, [r7, #8]
	ldr r0, [r7, #8]
	ldr r2, [r7, #4]
	adds r1, r2, #0
	adds r2, r1, #0
	lsls r1, r2, #6
	ldrb r2, [r0, #1]
	movs r3, #0x3f
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0, #1]
	add sp, #0xc
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start sub_08001518
sub_08001518: @ 0x08001518
	push {r7, lr}
	sub sp, #0xc
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	ldr r1, [r7]
	adds r0, r1, #0
	lsls r2, r0, #0x10
	lsrs r1, r2, #0x10
	adds r0, r1, #0
	bl sub_08001348
	str r0, [r7, #8]
	ldr r0, [r7, #8]
	movs r1, #0
	ldr r2, [r7, #4]
	cmp r2, #8
	bne _0800153E
	movs r1, #1
_0800153E:
	adds r2, r1, #0
	lsls r1, r2, #7
	ldrb r2, [r0]
	movs r3, #0x7f
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	add sp, #0xc
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0800155C
sub_0800155C: @ 0x0800155C
	push {r7, lr}
	sub sp, #0x1c
	mov r7, sp
	str r0, [r7]
	ldr r0, _0800157C @ =0x02022860
	str r0, [r7, #4]
	movs r0, #0xa0
	lsls r0, r0, #0x13
	str r0, [r7, #8]
	movs r0, #0
	str r0, [r7, #0xc]
_08001572:
	ldr r0, [r7, #0xc]
	ldr r1, _08001580 @ =0x000001FF
	cmp r0, r1
	ble _08001584
	b _0800161C
	.align 2, 0
_0800157C: .4byte 0x02022860
_08001580: .4byte 0x000001FF
_08001584:
	ldr r0, [r7, #4]
	ldrh r1, [r0]
	movs r2, #0x1f
	adds r0, r1, #0
	ands r0, r2
	adds r2, r0, #0
	lsls r1, r2, #0x10
	lsrs r0, r1, #0x10
	ldr r1, [r7]
	adds r0, r0, r1
	str r0, [r7, #0x10]
	ldr r0, [r7, #4]
	ldrh r1, [r0]
	lsrs r0, r1, #5
	adds r1, r0, #0
	movs r2, #0x1f
	adds r0, r1, #0
	ands r0, r2
	adds r2, r0, #0
	lsls r1, r2, #0x10
	lsrs r0, r1, #0x10
	ldr r1, [r7]
	adds r0, r0, r1
	str r0, [r7, #0x14]
	ldr r0, [r7, #4]
	ldrh r1, [r0]
	lsrs r0, r1, #0xa
	adds r1, r0, #0
	movs r2, #0x1f
	adds r0, r1, #0
	ands r0, r2
	adds r2, r0, #0
	lsls r1, r2, #0x10
	lsrs r0, r1, #0x10
	ldr r1, [r7]
	adds r0, r0, r1
	str r0, [r7, #0x18]
	ldr r0, [r7, #0x10]
	cmp r0, #0x1f
	ble _080015D8
	movs r0, #0x1f
	str r0, [r7, #0x10]
_080015D8:
	ldr r0, [r7, #0x14]
	cmp r0, #0x1f
	ble _080015E2
	movs r0, #0x1f
	str r0, [r7, #0x14]
_080015E2:
	ldr r0, [r7, #0x18]
	cmp r0, #0x1f
	ble _080015EC
	movs r0, #0x1f
	str r0, [r7, #0x18]
_080015EC:
	ldr r0, [r7, #8]
	ldr r1, [r7, #0x18]
	adds r2, r1, #0
	lsls r1, r2, #0xa
	ldr r3, [r7, #0x14]
	adds r2, r3, #0
	lsls r3, r2, #5
	adds r2, r3, #0
	adds r1, r1, r2
	ldr r3, [r7, #0x10]
	adds r2, r3, #0
	adds r2, r1, r2
	adds r1, r2, #0
	strh r1, [r0]
	ldr r0, [r7, #4]
	adds r1, r0, #2
	str r1, [r7, #4]
	ldr r0, [r7, #8]
	adds r1, r0, #2
	str r1, [r7, #8]
	ldr r0, [r7, #0xc]
	adds r1, r0, #1
	str r1, [r7, #0xc]
	b _08001572
_0800161C:
	add sp, #0x1c
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start sub_08001624
sub_08001624: @ 0x08001624
	push {r7, lr}
	sub sp, #0x1c
	mov r7, sp
	str r0, [r7]
	ldr r0, _08001644 @ =0x02022860
	str r0, [r7, #4]
	movs r0, #0xa0
	lsls r0, r0, #0x13
	str r0, [r7, #8]
	movs r0, #0
	str r0, [r7, #0xc]
_0800163A:
	ldr r0, [r7, #0xc]
	ldr r1, _08001648 @ =0x000001FF
	cmp r0, r1
	ble _0800164C
	b _080016E4
	.align 2, 0
_08001644: .4byte 0x02022860
_08001648: .4byte 0x000001FF
_0800164C:
	ldr r0, [r7, #4]
	ldrh r1, [r0]
	movs r2, #0x1f
	adds r0, r1, #0
	ands r0, r2
	adds r2, r0, #0
	lsls r1, r2, #0x10
	lsrs r0, r1, #0x10
	ldr r1, [r7]
	adds r0, r0, r1
	str r0, [r7, #0x10]
	ldr r0, [r7, #4]
	ldrh r1, [r0]
	lsrs r0, r1, #5
	adds r1, r0, #0
	movs r2, #0x1f
	adds r0, r1, #0
	ands r0, r2
	adds r2, r0, #0
	lsls r1, r2, #0x10
	lsrs r0, r1, #0x10
	ldr r1, [r7]
	adds r0, r0, r1
	str r0, [r7, #0x14]
	ldr r0, [r7, #4]
	ldrh r1, [r0]
	lsrs r0, r1, #0xa
	adds r1, r0, #0
	movs r2, #0x1f
	adds r0, r1, #0
	ands r0, r2
	adds r2, r0, #0
	lsls r1, r2, #0x10
	lsrs r0, r1, #0x10
	ldr r1, [r7]
	adds r0, r0, r1
	str r0, [r7, #0x18]
	ldr r0, [r7, #0x10]
	cmp r0, #0
	bge _080016A0
	movs r0, #0
	str r0, [r7, #0x10]
_080016A0:
	ldr r0, [r7, #0x14]
	cmp r0, #0
	bge _080016AA
	movs r0, #0
	str r0, [r7, #0x14]
_080016AA:
	ldr r0, [r7, #0x18]
	cmp r0, #0
	bge _080016B4
	movs r0, #0
	str r0, [r7, #0x18]
_080016B4:
	ldr r0, [r7, #8]
	ldr r1, [r7, #0x18]
	adds r2, r1, #0
	lsls r1, r2, #0xa
	ldr r3, [r7, #0x14]
	adds r2, r3, #0
	lsls r3, r2, #5
	adds r2, r3, #0
	adds r1, r1, r2
	ldr r3, [r7, #0x10]
	adds r2, r3, #0
	adds r2, r1, r2
	adds r1, r2, #0
	strh r1, [r0]
	ldr r0, [r7, #4]
	adds r1, r0, #2
	str r1, [r7, #4]
	ldr r0, [r7, #8]
	adds r1, r0, #2
	str r1, [r7, #8]
	ldr r0, [r7, #0xc]
	adds r1, r0, #1
	str r1, [r7, #0xc]
	b _0800163A
_080016E4:
	add sp, #0x1c
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start sub_080016EC
sub_080016EC: @ 0x080016EC
	push {r7, lr}
	mov r7, sp
	ldr r0, _080017AC @ =0x0300000C
	ldrb r1, [r0]
	movs r2, #1
	adds r0, r1, #0
	ands r0, r2
	adds r2, r0, #0
	lsls r1, r2, #0x18
	lsrs r0, r1, #0x18
	cmp r0, #0
	beq _08001712
	ldr r0, _080017B0 @ =0x02022C60
	ldr r2, _080017B4 @ =0x02024C60
	ldr r1, [r2]
	movs r2, #0x80
	lsls r2, r2, #2
	bl CpuFastSet
_08001712:
	ldr r0, _080017AC @ =0x0300000C
	ldrb r1, [r0]
	movs r2, #2
	adds r0, r1, #0
	ands r0, r2
	adds r2, r0, #0
	lsls r1, r2, #0x18
	lsrs r0, r1, #0x18
	cmp r0, #0
	beq _08001734
	ldr r0, _080017B8 @ =0x02023460
	ldr r2, _080017B4 @ =0x02024C60
	ldr r1, [r2, #4]
	movs r2, #0x80
	lsls r2, r2, #2
	bl CpuFastSet
_08001734:
	ldr r0, _080017AC @ =0x0300000C
	ldrb r1, [r0]
	movs r2, #4
	adds r0, r1, #0
	ands r0, r2
	adds r2, r0, #0
	lsls r1, r2, #0x18
	lsrs r0, r1, #0x18
	cmp r0, #0
	beq _08001756
	ldr r0, _080017BC @ =0x02023C60
	ldr r2, _080017B4 @ =0x02024C60
	ldr r1, [r2, #8]
	movs r2, #0x80
	lsls r2, r2, #2
	bl CpuFastSet
_08001756:
	ldr r0, _080017AC @ =0x0300000C
	ldrb r1, [r0]
	movs r2, #8
	adds r0, r1, #0
	ands r0, r2
	adds r2, r0, #0
	lsls r1, r2, #0x18
	lsrs r0, r1, #0x18
	cmp r0, #0
	beq _08001778
	ldr r0, _080017C0 @ =0x02024460
	ldr r2, _080017B4 @ =0x02024C60
	ldr r1, [r2, #0xc]
	movs r2, #0x80
	lsls r2, r2, #2
	bl CpuFastSet
_08001778:
	ldr r0, _080017AC @ =0x0300000C
	movs r1, #0
	strb r1, [r0]
	ldr r0, _080017C4 @ =0x0300000D
	movs r1, #0
	ldrsb r1, [r0, r1]
	cmp r1, #1
	bne _08001804
	ldr r0, _080017C4 @ =0x0300000D
	movs r1, #0
	strb r1, [r0]
	ldr r1, _080017C8 @ =0x03002870
	adds r0, r1, #0
	adds r1, #0x68
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0
	bne _080017D0
	ldr r0, _080017CC @ =0x02022860
	movs r1, #0xa0
	lsls r1, r1, #0x13
	movs r2, #0x80
	lsls r2, r2, #1
	bl CpuFastSet
	b _08001804
	.align 2, 0
_080017AC: .4byte 0x0300000C
_080017B0: .4byte 0x02022C60
_080017B4: .4byte 0x02024C60
_080017B8: .4byte 0x02023460
_080017BC: .4byte 0x02023C60
_080017C0: .4byte 0x02024460
_080017C4: .4byte 0x0300000D
_080017C8: .4byte 0x03002870
_080017CC: .4byte 0x02022860
_080017D0:
	ldr r1, _080017F0 @ =0x03002870
	adds r0, r1, #0
	adds r1, #0x68
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0
	ble _080017F4
	ldr r1, _080017F0 @ =0x03002870
	adds r0, r1, #0
	adds r1, #0x68
	movs r2, #0
	ldrsb r2, [r1, r2]
	adds r0, r2, #0
	bl sub_0800155C
	b _08001804
	.align 2, 0
_080017F0: .4byte 0x03002870
_080017F4:
	ldr r1, _0800180C @ =0x03002870
	adds r0, r1, #0
	adds r1, #0x68
	movs r2, #0
	ldrsb r2, [r1, r2]
	adds r0, r2, #0
	bl sub_08001624
_08001804:
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800180C: .4byte 0x03002870

	thumb_func_start TmFill
TmFill: @ 0x08001810
	push {r7, lr}
	sub sp, #0xc
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	ldr r1, [r7, #4]
	lsls r0, r1, #0x10
	ldr r1, [r7, #4]
	adds r0, r1, r0
	str r0, [r7, #4]
	ldr r0, [r7, #4]
	str r0, [r7, #8]
	adds r0, r7, #0
	adds r0, #8
	ldr r2, _0800183C @ =0x01000200
	ldr r1, [r7]
	bl CpuFastSet
	add sp, #0xc
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800183C: .4byte 0x01000200

	thumb_func_start sub_08001840
sub_08001840: @ 0x08001840
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, [r7]
	adds r1, r0, #0
	lsls r0, r1, #5
	movs r2, #0xc0
	lsls r2, r2, #0x13
	adds r1, r0, r2
	movs r0, #0
	movs r2, #0x20
	bl sub_080030FC
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start SetOnVBlank
SetOnVBlank: @ 0x08001864
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, [r7]
	cmp r0, #0
	beq _080018A0
	ldr r0, _08001898 @ =0x03002870
	ldrb r1, [r0, #4]
	movs r2, #8
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0, #4]
	movs r0, #0
	ldr r1, [r7]
	bl SetIrqFunc
	ldr r0, _0800189C @ =0x04000200
	ldr r1, _0800189C @ =0x04000200
	ldrh r2, [r1]
	movs r3, #1
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0]
	b _080018BC
	.align 2, 0
_08001898: .4byte 0x03002870
_0800189C: .4byte 0x04000200
_080018A0:
	ldr r0, _080018C4 @ =0x03002870
	ldrb r1, [r0, #4]
	movs r2, #0xf7
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0, #4]
	ldr r0, _080018C8 @ =0x04000200
	ldr r1, _080018C8 @ =0x04000200
	ldrh r2, [r1]
	ldr r3, _080018CC @ =0x0000FFFE
	adds r1, r2, #0
	ands r1, r3
	adds r2, r1, #0
	strh r2, [r0]
_080018BC:
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_080018C4: .4byte 0x03002870
_080018C8: .4byte 0x04000200
_080018CC: .4byte 0x0000FFFE

	thumb_func_start sub_080018D0
sub_080018D0: @ 0x080018D0
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, [r7]
	cmp r0, #0
	beq _0800190C
	ldr r0, _08001904 @ =0x03002870
	ldrb r1, [r0, #4]
	movs r2, #0x20
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0, #4]
	movs r0, #2
	ldr r1, [r7]
	bl SetIrqFunc
	ldr r0, _08001908 @ =0x04000200
	ldr r1, _08001908 @ =0x04000200
	ldrh r2, [r1]
	movs r3, #4
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0]
	b _08001934
	.align 2, 0
_08001904: .4byte 0x03002870
_08001908: .4byte 0x04000200
_0800190C:
	ldr r0, _0800193C @ =0x03002870
	ldrb r1, [r0, #4]
	movs r2, #0xdf
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0, #4]
	ldr r0, _08001940 @ =0x04000200
	ldr r1, _08001940 @ =0x04000200
	ldrh r2, [r1]
	ldr r3, _08001944 @ =0x0000FFFB
	adds r1, r2, #0
	ands r1, r3
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, _0800193C @ =0x03002870
	ldrb r1, [r0, #5]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0, #5]
_08001934:
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800193C: .4byte 0x03002870
_08001940: .4byte 0x04000200
_08001944: .4byte 0x0000FFFB

	thumb_func_start sub_08001948
sub_08001948: @ 0x08001948
	push {r7, lr}
	sub sp, #8
	mov r7, sp
	str r0, [r7]
	adds r0, r7, #4
	ldr r1, _0800198C @ =0x04000004
	ldrh r2, [r1]
	strh r2, [r0]
	adds r0, r7, #4
	adds r1, r7, #4
	ldrh r2, [r1]
	movs r3, #0xff
	adds r1, r2, #0
	ands r1, r3
	adds r2, r1, #0
	strh r2, [r0]
	adds r0, r7, #4
	adds r1, r7, #4
	ldr r3, [r7]
	adds r2, r3, #0
	lsls r3, r2, #8
	ldrh r1, [r1]
	adds r2, r3, #0
	orrs r1, r2
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, _0800198C @ =0x04000004
	adds r1, r7, #4
	ldrh r2, [r1]
	strh r2, [r0]
	add sp, #8
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800198C: .4byte 0x04000004

	thumb_func_start sub_08001990
sub_08001990: @ 0x08001990
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, _080019B4 @ =0x03002870
	ldr r2, [r7]
	adds r1, r2, #0
	ldrb r2, [r0, #5]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0, #5]
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_080019B4: .4byte 0x03002870

	thumb_func_start sub_080019B8
sub_080019B8: @ 0x080019B8
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, _080019D0 @ =0x02024C70
	ldr r1, [r7]
	str r1, [r0]
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_080019D0: .4byte 0x02024C70

	thumb_func_start RunMainFunc
RunMainFunc: @ 0x080019D4
	push {r4, r7, lr}
	mov r7, sp
	ldr r0, _080019F0 @ =0x02024C70
	ldr r1, [r0]
	cmp r1, #0
	beq _080019E8
	ldr r0, _080019F0 @ =0x02024C70
	ldr r4, [r0]
	bl _call_via_r4
_080019E8:
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080019F0: .4byte 0x02024C70

	thumb_func_start sub_080019F4
sub_080019F4: @ 0x080019F4
	push {r4, r7, lr}
	sub sp, #8
	mov r7, sp
	str r0, [r7]
	adds r0, r1, #0
	adds r1, r7, #4
	strh r0, [r1]
	ldr r0, [r7]
	ldr r1, [r7]
	ldrh r2, [r0, #0xa]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	ldrh r1, [r1, #4]
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0, #0xa]
	ldr r0, [r7]
	adds r1, r7, #4
	ldrh r2, [r0, #4]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	ldrh r1, [r1]
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0, #4]
	ldr r0, [r7]
	ldr r1, [r7]
	ldr r2, [r7]
	ldr r3, [r7]
	ldrh r2, [r2, #4]
	ldrh r3, [r3, #0xa]
	eors r2, r3
	ldr r3, [r7]
	ldrh r3, [r3, #4]
	adds r4, r3, #0
	ands r2, r4
	ldrh r3, [r1, #6]
	movs r4, #0
	ands r3, r4
	adds r4, r3, #0
	adds r3, r2, #0
	orrs r4, r3
	adds r3, r4, #0
	strh r3, [r1, #6]
	adds r1, r2, #0
	movs r2, #0
	bics r1, r2
	ldrh r2, [r0, #8]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0, #8]
	ldr r0, [r7]
	ldrh r1, [r0, #8]
	cmp r1, #0
	beq _08001A88
	ldr r0, [r7]
	ldr r1, [r7]
	ldrh r2, [r0, #0xc]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	ldrh r1, [r1, #4]
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0, #0xc]
_08001A88:
	ldr r0, [r7]
	ldrh r1, [r0, #0xe]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0, #0xe]
	ldr r0, [r7]
	ldrh r1, [r0, #4]
	cmp r1, #0
	bne _08001AD0
	ldr r0, [r7]
	ldrh r1, [r0, #0xc]
	cmp r1, #0
	beq _08001AD0
	ldr r0, [r7]
	ldr r1, [r7]
	ldrh r2, [r1, #0xa]
	ldr r3, _08001B34 @ =0x00000303
	adds r1, r2, #0
	ands r1, r3
	ldrh r0, [r0, #0xc]
	lsls r2, r1, #0x10
	lsrs r1, r2, #0x10
	cmp r0, r1
	bne _08001AD0
	ldr r0, [r7]
	ldr r1, [r7]
	ldrh r2, [r0, #0xe]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	ldrh r1, [r1, #0xa]
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0, #0xe]
_08001AD0:
	ldr r0, [r7]
	ldrh r1, [r0, #4]
	cmp r1, #0
	beq _08001B38
	ldr r0, [r7]
	ldr r1, [r7]
	ldrh r0, [r0, #4]
	ldrh r1, [r1, #0xa]
	cmp r0, r1
	bne _08001B38
	ldr r1, [r7]
	ldr r0, [r7]
	ldr r1, [r7]
	ldrb r2, [r1, #2]
	subs r1, r2, #1
	ldrb r2, [r0, #2]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0, #2]
	ldr r0, [r7]
	ldrb r1, [r0, #2]
	cmp r1, #0
	bne _08001B32
	ldr r0, [r7]
	ldr r1, [r7]
	ldrh r2, [r0, #6]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	ldrh r1, [r1, #4]
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0, #6]
	ldr r0, [r7]
	ldr r1, [r7]
	ldrb r2, [r0, #2]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	ldrb r1, [r1, #1]
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0, #2]
_08001B32:
	b _08001B4E
	.align 2, 0
_08001B34: .4byte 0x00000303
_08001B38:
	ldr r0, [r7]
	ldr r1, [r7]
	ldrb r2, [r0, #2]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	ldrb r1, [r1]
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0, #2]
_08001B4E:
	ldr r0, [r7]
	ldr r1, [r7]
	ldr r2, [r7]
	ldrh r1, [r1, #4]
	ldrh r2, [r2, #0x10]
	eors r1, r2
	ldr r2, [r7]
	ldrh r2, [r2, #4]
	adds r3, r2, #0
	ands r1, r3
	ldrh r2, [r0, #0x10]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0, #0x10]
	adds r0, r7, #4
	ldrh r1, [r0]
	ldr r2, _08001B94 @ =0x000003F3
	adds r0, r1, #0
	ands r0, r2
	adds r2, r0, #0
	lsls r1, r2, #0x10
	asrs r0, r1, #0x10
	cmp r0, #0
	beq _08001B98
	ldr r0, [r7]
	ldrh r1, [r0, #0x12]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0, #0x12]
	b _08001BBC
	.align 2, 0
_08001B94: .4byte 0x000003F3
_08001B98:
	ldr r0, [r7]
	ldrh r1, [r0, #0x12]
	ldr r0, _08001BC4 @ =0x0000FFFE
	cmp r1, r0
	bhi _08001BBC
	ldr r1, [r7]
	ldr r0, [r7]
	ldr r1, [r7]
	ldrh r2, [r1, #0x12]
	adds r1, r2, #1
	ldrh r2, [r0, #0x12]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0, #0x12]
_08001BBC:
	add sp, #8
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08001BC4: .4byte 0x0000FFFE

	thumb_func_start RefreshKeySt
RefreshKeySt: @ 0x08001BC8
	push {r7, lr}
	sub sp, #8
	mov r7, sp
	str r0, [r7]
	ldr r0, _08001C14 @ =0x04000130
	ldrh r1, [r0]
	mvns r0, r1
	adds r2, r0, #0
	lsls r1, r2, #0x10
	lsrs r0, r1, #0x10
	str r0, [r7, #4]
	ldr r0, [r7, #4]
	lsls r1, r0, #0x16
	lsrs r0, r1, #0x16
	str r0, [r7, #4]
	ldr r0, [r7, #4]
	movs r1, #0xf
	ands r0, r1
	cmp r0, #0xf
	beq _08001BFC
	ldr r0, _08001C18 @ =0x0300000E
	ldrh r1, [r0]
	mvns r0, r1
	ldr r1, [r7, #4]
	ands r0, r1
	str r0, [r7, #4]
_08001BFC:
	ldr r1, [r7, #4]
	adds r0, r1, #0
	lsls r2, r0, #0x10
	asrs r1, r2, #0x10
	ldr r0, [r7]
	bl sub_080019F4
	add sp, #8
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08001C14: .4byte 0x04000130
_08001C18: .4byte 0x0300000E

	thumb_func_start sub_08001C1C
sub_08001C1C: @ 0x08001C1C
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, [r7]
	ldrh r1, [r0, #8]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0, #8]
	ldr r0, [r7]
	ldrh r1, [r0, #6]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0, #6]
	ldr r0, [r7]
	ldrh r1, [r0, #4]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0, #4]
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start InitKeySt
InitKeySt: @ 0x08001C50
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, [r7]
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0xc
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7]
	ldrb r1, [r0, #1]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #4
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0, #1]
	ldr r0, [r7]
	ldrh r1, [r0, #0xa]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0, #0xa]
	ldr r0, [r7]
	ldrh r1, [r0, #4]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0, #4]
	ldr r0, [r7]
	ldrh r1, [r0, #8]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0, #8]
	ldr r0, [r7]
	ldrb r1, [r0, #2]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0, #2]
	ldr r0, [r7]
	ldrh r1, [r0, #0x12]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0, #0x12]
	ldr r0, _08001CCC @ =0x0300000E
	movs r1, #0
	strh r1, [r0]
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08001CCC: .4byte 0x0300000E

	thumb_func_start sub_08001CD0
sub_08001CD0: @ 0x08001CD0
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, _08001CE8 @ =0x0300000E
	ldr r1, [r7]
	adds r2, r1, #0
	strh r2, [r0]
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08001CE8: .4byte 0x0300000E

	thumb_func_start sub_08001CEC
sub_08001CEC: @ 0x08001CEC
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r1, _08001D50 @ =0x08B857F8
	ldr r0, [r1]
	ldr r1, [r7]
	adds r2, r1, #0
	adds r1, #0x64
	ldrh r2, [r0, #8]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	ldrh r1, [r1]
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0, #8]
	ldr r1, _08001D50 @ =0x08B857F8
	ldr r0, [r1]
	ldr r1, [r7]
	adds r2, r1, #0
	adds r1, #0x64
	ldrh r2, [r0, #6]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	ldrh r1, [r1]
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0, #6]
	ldr r1, _08001D50 @ =0x08B857F8
	ldr r0, [r1]
	ldr r1, [r7]
	adds r2, r1, #0
	adds r1, #0x64
	ldrh r2, [r0, #4]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	ldrh r1, [r1]
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0, #4]
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08001D50: .4byte 0x08B857F8

	thumb_func_start sub_08001D54
sub_08001D54: @ 0x08001D54
	push {r7, lr}
	sub sp, #8
	mov r7, sp
	str r0, [r7]
	ldr r1, _08001D88 @ =0x08B857FC
	adds r0, r1, #0
	movs r1, #1
	bl SpawnProc
	str r0, [r7, #4]
	ldr r1, [r7, #4]
	ldr r2, [r7]
	adds r0, r2, #0
	adds r2, r1, #0
	adds r1, #0x64
	ldrh r2, [r1]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r0, r3
	adds r2, r0, #0
	strh r2, [r1]
	add sp, #8
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08001D88: .4byte 0x08B857FC

	thumb_func_start SetBgOffset
SetBgOffset: @ 0x08001D8C
	push {r7, lr}
	sub sp, #8
	mov r7, sp
	adds r3, r0, #0
	adds r0, r2, #0
	adds r2, r7, #0
	strh r3, [r2]
	adds r2, r7, #2
	strh r1, [r2]
	adds r1, r7, #4
	strh r0, [r1]
	adds r1, r7, #0
	ldrh r0, [r1]
	cmp r0, #1
	beq _08001DF0
	cmp r0, #1
	bgt _08001DB4
	cmp r0, #0
	beq _08001DBE
	b _08001E8C
_08001DB4:
	cmp r0, #2
	beq _08001E24
	cmp r0, #3
	beq _08001E58
	b _08001E8C
_08001DBE:
	ldr r0, _08001DEC @ =0x03002870
	adds r1, r7, #2
	ldrh r2, [r0, #0x1c]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	ldrh r1, [r1]
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0, #0x1c]
	ldr r0, _08001DEC @ =0x03002870
	adds r1, r7, #4
	ldrh r2, [r0, #0x1e]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	ldrh r1, [r1]
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0, #0x1e]
	b _08001E8C
	.align 2, 0
_08001DEC: .4byte 0x03002870
_08001DF0:
	ldr r0, _08001E20 @ =0x03002870
	adds r1, r7, #2
	ldrh r2, [r0, #0x20]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	ldrh r1, [r1]
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0, #0x20]
	ldr r0, _08001E20 @ =0x03002870
	adds r1, r7, #4
	ldrh r2, [r0, #0x22]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	ldrh r1, [r1]
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0, #0x22]
	b _08001E8C
	.align 2, 0
_08001E20: .4byte 0x03002870
_08001E24:
	ldr r0, _08001E54 @ =0x03002870
	adds r1, r7, #2
	ldrh r2, [r0, #0x24]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	ldrh r1, [r1]
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0, #0x24]
	ldr r0, _08001E54 @ =0x03002870
	adds r1, r7, #4
	ldrh r2, [r0, #0x26]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	ldrh r1, [r1]
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0, #0x26]
	b _08001E8C
	.align 2, 0
_08001E54: .4byte 0x03002870
_08001E58:
	ldr r0, _08001E88 @ =0x03002870
	adds r1, r7, #2
	ldrh r2, [r0, #0x28]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	ldrh r1, [r1]
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0, #0x28]
	ldr r0, _08001E88 @ =0x03002870
	adds r1, r7, #4
	ldrh r2, [r0, #0x2a]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	ldrh r1, [r1]
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0, #0x2a]
	b _08001E8C
	.align 2, 0
_08001E88: .4byte 0x03002870
_08001E8C:
	add sp, #8
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start sub_08001E94
sub_08001E94: @ 0x08001E94
	push {r7, lr}
	mov r7, sp
	ldr r0, _08001EBC @ =0x03000014
	ldr r1, _08001EC0 @ =0x03000015
	movs r2, #0
	strb r2, [r1]
	movs r1, #0
	strb r1, [r0]
	ldr r1, _08001EC4 @ =0x02022C60
	adds r0, r1, #0
	movs r1, #0
	bl TmFill
	movs r0, #1
	bl EnableBgSync
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08001EBC: .4byte 0x03000014
_08001EC0: .4byte 0x03000015
_08001EC4: .4byte 0x02022C60

	thumb_func_start sub_08001EC8
sub_08001EC8: @ 0x08001EC8
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	adds r2, r0, #0
	adds r0, r1, #0
	adds r1, r7, #0
	strb r2, [r1]
	adds r1, r7, #1
	strb r0, [r1]
	ldr r0, _08001EF4 @ =0x03000014
	adds r1, r7, #0
	ldrb r2, [r1]
	strb r2, [r0]
	ldr r0, _08001EF8 @ =0x03000015
	adds r1, r7, #1
	ldrb r2, [r1]
	strb r2, [r0]
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08001EF4: .4byte 0x03000014
_08001EF8: .4byte 0x03000015

	thumb_func_start sub_08001EFC
sub_08001EFC: @ 0x08001EFC
	push {r7, lr}
	sub sp, #0xc
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	ldr r0, _08001F14 @ =0x0000027F
	str r0, [r7, #8]
_08001F0A:
	ldr r0, [r7, #8]
	cmp r0, #0
	bge _08001F18
	b _08001F32
	.align 2, 0
_08001F14: .4byte 0x0000027F
_08001F18:
	ldr r0, [r7]
	adds r1, r7, #4
	ldr r2, [r1]
	ldrh r3, [r2]
	strh r3, [r0]
	adds r2, #2
	str r2, [r1]
	adds r0, #2
	str r0, [r7]
	ldr r0, [r7, #8]
	subs r1, r0, #1
	str r1, [r7, #8]
	b _08001F0A
_08001F32:
	add sp, #0xc
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_08001F3C
sub_08001F3C: @ 0x08001F3C
	push {r4, r5, r7, lr}
	sub sp, #0x18
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	adds r1, r2, #0
	adds r0, r3, #0
	adds r2, r7, #0
	adds r2, #8
	strb r1, [r2]
	adds r1, r7, #0
	adds r1, #9
	strb r0, [r1]
	ldr r0, [r7, #4]
	adds r1, r0, #2
	str r1, [r7, #0xc]
	adds r0, r7, #0
	adds r0, #0x14
	ldr r1, [r7, #4]
	ldr r2, [r1]
	adds r1, r2, #0
	strb r1, [r0]
	adds r0, r7, #0
	adds r0, #0x15
	ldr r1, [r7, #4]
	ldr r2, [r1]
	lsrs r1, r2, #8
	adds r2, r1, #0
	strb r2, [r0]
	adds r0, r7, #0
	adds r0, #0x17
	adds r1, r7, #0
	adds r1, #0x15
	ldrb r2, [r1]
	strb r2, [r0]
_08001F82:
	adds r0, r7, #0
	adds r0, #0x17
	movs r1, #0
	ldrsb r1, [r0, r1]
	cmp r1, #0
	bge _08001F90
	b _0800200E
_08001F90:
	adds r1, r7, #0
	adds r1, #0x17
	movs r0, #0
	ldrsb r0, [r1, r0]
	adds r1, r7, #0
	adds r1, #9
	ldrb r2, [r1]
	lsls r0, r2
	ldr r1, [r7]
	adds r0, r1, r0
	str r0, [r7, #0x10]
	adds r0, r7, #0
	adds r0, #0x16
	adds r1, r7, #0
	adds r1, #0x14
	ldrb r2, [r1]
	strb r2, [r0]
_08001FB2:
	adds r0, r7, #0
	adds r0, #0x16
	movs r1, #0
	ldrsb r1, [r0, r1]
	cmp r1, #0
	bge _08001FC0
	b _08001FF8
_08001FC0:
	adds r0, r7, #0
	adds r0, #0x10
	ldr r1, [r0]
	adds r2, r7, #0
	adds r2, #0xc
	ldr r3, [r2]
	adds r4, r7, #0
	adds r4, #8
	ldrb r5, [r3]
	ldrb r4, [r4]
	adds r5, r5, r4
	adds r4, r5, #0
	strb r4, [r1]
	adds r3, #1
	str r3, [r2]
	adds r1, #1
	str r1, [r0]
	adds r1, r7, #0
	adds r1, #0x16
	adds r0, r7, #0
	adds r0, #0x16
	adds r1, r7, #0
	adds r1, #0x16
	ldrb r2, [r1]
	subs r1, r2, #1
	adds r2, r1, #0
	strb r2, [r0]
	b _08001FB2
_08001FF8:
	adds r1, r7, #0
	adds r1, #0x17
	adds r0, r7, #0
	adds r0, #0x17
	adds r1, r7, #0
	adds r1, #0x17
	ldrb r2, [r1]
	subs r1, r2, #1
	adds r2, r1, #0
	strb r2, [r0]
	b _08001F82
_0800200E:
	add sp, #0x18
	pop {r4, r5, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_08002018
sub_08002018: @ 0x08002018
	push {r7, lr}
	sub sp, #0x24
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
	ldr r0, [r7, #4]
	ldrh r1, [r0]
	movs r2, #0xff
	adds r0, r1, #0
	ands r0, r2
	adds r2, r0, #0
	lsls r1, r2, #0x10
	asrs r0, r1, #0x10
	str r0, [r7, #0xc]
	ldr r0, [r7, #4]
	movs r2, #0
	ldrsh r1, [r0, r2]
	asrs r0, r1, #8
	adds r1, r0, #0
	movs r2, #0xff
	adds r0, r1, #0
	ands r0, r2
	adds r2, r0, #0
	lsls r1, r2, #0x10
	asrs r0, r1, #0x10
	str r0, [r7, #0x10]
	movs r0, #0
	str r0, [r7, #0x1c]
	ldr r0, [r7, #4]
	adds r1, r0, #2
	str r1, [r7, #4]
	movs r0, #0
	str r0, [r7, #0x18]
_0800205C:
	ldr r0, [r7, #0x18]
	ldr r1, [r7, #0x10]
	cmp r0, r1
	blt _08002066
	b _080020B4
_08002066:
	ldr r1, [r7, #0x18]
	lsls r0, r1, #5
	adds r1, r0, #0
	lsls r0, r1, #1
	ldr r1, [r7]
	adds r0, r1, r0
	str r0, [r7, #0x20]
	movs r0, #0
	str r0, [r7, #0x14]
_08002078:
	ldr r0, [r7, #0x14]
	ldr r1, [r7, #0xc]
	cmp r0, r1
	blt _08002082
	b _080020AC
_08002082:
	adds r0, r7, #4
	ldr r1, [r0]
	movs r3, #0
	ldrsh r2, [r1, r3]
	ldr r3, [r7, #0x1c]
	adds r2, r3, r2
	str r2, [r7, #0x1c]
	adds r1, #2
	str r1, [r0]
	adds r0, r7, #0
	adds r0, #0x20
	ldr r1, [r0]
	ldr r3, [r7, #0x1c]
	adds r2, r3, #0
	strh r2, [r1]
	adds r1, #2
	str r1, [r0]
	ldr r0, [r7, #0x14]
	adds r1, r0, #1
	str r1, [r7, #0x14]
	b _08002078
_080020AC:
	ldr r0, [r7, #0x18]
	adds r1, r0, #1
	str r1, [r7, #0x18]
	b _0800205C
_080020B4:
	add sp, #0x24
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start sub_080020BC
sub_080020BC: @ 0x080020BC
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	movs r0, #0x1f
	str r0, [r7]
_080020C6:
	ldr r0, [r7]
	cmp r0, #0
	bge _080020CE
	b _080020EC
_080020CE:
	ldr r0, _080020E8 @ =0x02022240
	ldr r1, [r7]
	adds r0, r0, r1
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7]
	subs r1, r0, #1
	str r1, [r7]
	b _080020C6
	.align 2, 0
_080020E8: .4byte 0x02022240
_080020EC:
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start sub_080020F4
sub_080020F4: @ 0x080020F4
	push {r4, r5, r7, lr}
	sub sp, #0x20
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
	str r3, [r7, #0xc]
	ldr r0, [r7, #0xc]
	cmp r0, #0
	bge _0800210C
	movs r0, #0x20
	b _0800210E
_0800210C:
	movs r0, #0
_0800210E:
	str r0, [r7, #0x18]
	ldr r0, [r7, #4]
	adds r2, r0, #0
	lsls r1, r2, #1
	adds r1, r1, r0
	lsls r0, r1, #4
	str r0, [r7, #0x1c]
	movs r0, #0
	str r0, [r7, #0x10]
_08002120:
	ldr r0, [r7, #0x10]
	ldr r1, [r7, #8]
	cmp r0, r1
	blt _0800212A
	b _08002210
_0800212A:
	ldr r0, _08002154 @ =0x02022240
	ldr r1, [r7, #4]
	ldr r2, [r7, #0x10]
	adds r1, r1, r2
	adds r0, r0, r1
	ldr r2, [r7, #0xc]
	adds r1, r2, #0
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	movs r0, #0
	str r0, [r7, #0x14]
_0800214A:
	ldr r0, [r7, #0x14]
	cmp r0, #0xf
	ble _08002158
	b _08002208
	.align 2, 0
_08002154: .4byte 0x02022240
_08002158:
	ldr r2, _08002204 @ =0x02022260
	adds r0, r7, #0
	adds r0, #0x1c
	ldr r1, [r0]
	adds r3, r1, #0
	adds r2, r2, r3
	ldr r3, [r7]
	ldrh r4, [r3]
	adds r3, r4, #0
	movs r4, #0x1f
	ands r3, r4
	ldr r5, [r7, #0x18]
	adds r4, r5, #0
	adds r5, r3, #0
	adds r3, r4, r5
	ldrb r4, [r2]
	movs r5, #0
	ands r4, r5
	adds r5, r4, #0
	adds r4, r5, #0
	orrs r4, r3
	adds r3, r4, #0
	strb r3, [r2]
	adds r1, #1
	str r1, [r0]
	ldr r2, _08002204 @ =0x02022260
	adds r0, r7, #0
	adds r0, #0x1c
	ldr r1, [r0]
	adds r3, r1, #0
	adds r2, r2, r3
	ldr r3, [r7]
	ldrh r4, [r3]
	lsrs r3, r4, #5
	adds r4, r3, #0
	movs r5, #0x1f
	adds r3, r4, #0
	ands r3, r5
	ldr r5, [r7, #0x18]
	adds r4, r5, #0
	adds r5, r3, #0
	adds r3, r4, r5
	ldrb r4, [r2]
	movs r5, #0
	ands r4, r5
	adds r5, r4, #0
	adds r4, r5, #0
	orrs r4, r3
	adds r3, r4, #0
	strb r3, [r2]
	adds r1, #1
	str r1, [r0]
	ldr r2, _08002204 @ =0x02022260
	adds r0, r7, #0
	adds r0, #0x1c
	ldr r1, [r0]
	adds r3, r1, #0
	adds r2, r2, r3
	ldr r3, [r7]
	ldrh r4, [r3]
	lsrs r3, r4, #0xa
	adds r4, r3, #0
	movs r5, #0x1f
	adds r3, r4, #0
	ands r3, r5
	ldr r5, [r7, #0x18]
	adds r4, r5, #0
	adds r5, r3, #0
	adds r3, r4, r5
	ldrb r4, [r2]
	movs r5, #0
	ands r4, r5
	adds r5, r4, #0
	adds r4, r5, #0
	orrs r4, r3
	adds r3, r4, #0
	strb r3, [r2]
	adds r1, #1
	str r1, [r0]
	ldr r0, [r7]
	adds r1, r0, #2
	str r1, [r7]
	ldr r0, [r7, #0x14]
	adds r1, r0, #1
	str r1, [r7, #0x14]
	b _0800214A
	.align 2, 0
_08002204: .4byte 0x02022260
_08002208:
	ldr r0, [r7, #0x10]
	adds r1, r0, #1
	str r1, [r7, #0x10]
	b _08002120
_08002210:
	add sp, #0x20
	pop {r4, r5, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_08002218
sub_08002218: @ 0x08002218
	push {r4, r5, r7, lr}
	sub sp, #0x20
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
	str r3, [r7, #0xc]
	ldr r0, [r7]
	adds r1, r0, #0
	lsls r0, r1, #4
	str r0, [r7, #0x18]
	ldr r0, [r7, #0x18]
	adds r1, r0, #0
	lsls r0, r1, #1
	ldr r1, _08002248 @ =0x02022860
	adds r0, r1, r0
	str r0, [r7, #0x1c]
	movs r0, #0
	str r0, [r7, #0x10]
_0800223E:
	ldr r0, [r7, #0x10]
	ldr r1, [r7, #4]
	cmp r0, r1
	blt _0800224C
	b _08002330
	.align 2, 0
_08002248: .4byte 0x02022860
_0800224C:
	ldr r0, _08002274 @ =0x02022240
	ldr r1, [r7]
	ldr r2, [r7, #0x10]
	adds r1, r1, r2
	adds r0, r0, r1
	ldr r2, [r7, #0xc]
	adds r1, r2, #0
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	movs r0, #0
	str r0, [r7, #0x14]
_0800226C:
	ldr r0, [r7, #0x14]
	cmp r0, #0xf
	ble _08002278
	b _08002328
	.align 2, 0
_08002274: .4byte 0x02022240
_08002278:
	ldr r2, _08002324 @ =0x02022260
	adds r0, r7, #0
	adds r0, #0x18
	ldr r1, [r0]
	adds r3, r1, #0
	adds r2, r2, r3
	ldr r3, [r7, #0x1c]
	ldrh r4, [r3]
	adds r3, r4, #0
	movs r4, #0x1f
	ands r3, r4
	ldr r5, [r7, #8]
	adds r4, r5, #0
	adds r5, r3, #0
	adds r3, r4, r5
	ldrb r4, [r2]
	movs r5, #0
	ands r4, r5
	adds r5, r4, #0
	adds r4, r5, #0
	orrs r4, r3
	adds r3, r4, #0
	strb r3, [r2]
	adds r1, #1
	str r1, [r0]
	ldr r2, _08002324 @ =0x02022260
	adds r0, r7, #0
	adds r0, #0x18
	ldr r1, [r0]
	adds r3, r1, #0
	adds r2, r2, r3
	ldr r3, [r7, #0x1c]
	ldrh r4, [r3]
	lsrs r3, r4, #5
	adds r4, r3, #0
	movs r5, #0x1f
	adds r3, r4, #0
	ands r3, r5
	ldr r5, [r7, #8]
	adds r4, r5, #0
	adds r5, r3, #0
	adds r3, r4, r5
	ldrb r4, [r2]
	movs r5, #0
	ands r4, r5
	adds r5, r4, #0
	adds r4, r5, #0
	orrs r4, r3
	adds r3, r4, #0
	strb r3, [r2]
	adds r1, #1
	str r1, [r0]
	ldr r2, _08002324 @ =0x02022260
	adds r0, r7, #0
	adds r0, #0x18
	ldr r1, [r0]
	adds r3, r1, #0
	adds r2, r2, r3
	ldr r3, [r7, #0x1c]
	ldrh r4, [r3]
	lsrs r3, r4, #0xa
	adds r4, r3, #0
	movs r5, #0x1f
	adds r3, r4, #0
	ands r3, r5
	ldr r5, [r7, #8]
	adds r4, r5, #0
	adds r5, r3, #0
	adds r3, r4, r5
	ldrb r4, [r2]
	movs r5, #0
	ands r4, r5
	adds r5, r4, #0
	adds r4, r5, #0
	orrs r4, r3
	adds r3, r4, #0
	strb r3, [r2]
	adds r1, #1
	str r1, [r0]
	ldr r0, [r7, #0x1c]
	adds r1, r0, #2
	str r1, [r7, #0x1c]
	ldr r0, [r7, #0x14]
	adds r1, r0, #1
	str r1, [r7, #0x14]
	b _0800226C
	.align 2, 0
_08002324: .4byte 0x02022260
_08002328:
	ldr r0, [r7, #0x10]
	adds r1, r0, #1
	str r1, [r7, #0x10]
	b _0800223E
_08002330:
	add sp, #0x20
	pop {r4, r5, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_08002338
sub_08002338: @ 0x08002338
	push {r7, lr}
	sub sp, #0x10
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
	ldr r0, [r7]
	str r0, [r7, #0xc]
_08002348:
	ldr r0, [r7]
	ldr r1, [r7, #4]
	adds r0, r0, r1
	ldr r1, [r7, #0xc]
	cmp r1, r0
	blt _08002356
	b _0800237C
_08002356:
	ldr r0, _08002378 @ =0x02022240
	ldr r1, [r7, #0xc]
	adds r0, r0, r1
	ldr r2, [r7, #8]
	adds r1, r2, #0
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7, #0xc]
	adds r1, r0, #1
	str r1, [r7, #0xc]
	b _08002348
	.align 2, 0
_08002378: .4byte 0x02022240
_0800237C:
	add sp, #0x10
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start sub_08002384
sub_08002384: @ 0x08002384
	push {r7, lr}
	sub sp, #0xc
	mov r7, sp
	adds r1, r7, #0
	strb r0, [r1]
	movs r0, #0x1f
	str r0, [r7, #4]
_08002392:
	ldr r0, [r7, #4]
	cmp r0, #0
	bge _0800239A
	b _080024B4
_0800239A:
	ldr r0, _080023C0 @ =0x02022240
	ldr r1, [r7, #4]
	adds r0, r0, r1
	adds r1, r7, #0
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	ldrb r1, [r1]
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	movs r0, #0
	str r0, [r7, #8]
_080023B8:
	ldr r0, [r7, #8]
	cmp r0, #0xf
	ble _080023C4
	b _080024AC
	.align 2, 0
_080023C0: .4byte 0x02022240
_080023C4:
	ldr r0, _080024A4 @ =0x02022260
	ldr r1, [r7, #4]
	adds r2, r1, #0
	lsls r1, r2, #4
	ldr r2, [r7, #8]
	adds r1, r1, r2
	adds r3, r1, #0
	lsls r2, r3, #1
	adds r2, r2, r1
	adds r0, r0, r2
	ldr r1, _080024A8 @ =0x02022860
	ldr r2, [r7, #4]
	adds r3, r2, #0
	lsls r2, r3, #4
	ldr r3, [r7, #8]
	adds r2, r2, r3
	adds r3, r2, #0
	lsls r2, r3, #1
	adds r1, r1, r2
	ldrh r2, [r1]
	adds r1, r2, #0
	movs r2, #0x1f
	ands r1, r2
	adds r2, r1, #0
	adds r1, r2, #0
	adds r1, #0x20
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	ldr r0, _080024A4 @ =0x02022260
	ldr r1, [r7, #4]
	adds r2, r1, #0
	lsls r1, r2, #4
	ldr r2, [r7, #8]
	adds r1, r1, r2
	adds r3, r1, #0
	lsls r2, r3, #1
	adds r2, r2, r1
	adds r1, r2, #1
	adds r0, r0, r1
	ldr r1, _080024A8 @ =0x02022860
	ldr r2, [r7, #4]
	adds r3, r2, #0
	lsls r2, r3, #4
	ldr r3, [r7, #8]
	adds r2, r2, r3
	adds r3, r2, #0
	lsls r2, r3, #1
	adds r1, r1, r2
	ldrh r2, [r1]
	lsrs r1, r2, #5
	adds r2, r1, #0
	movs r3, #0x1f
	adds r1, r2, #0
	ands r1, r3
	adds r2, r1, #0
	adds r1, r2, #0
	adds r1, #0x20
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	ldr r0, _080024A4 @ =0x02022260
	ldr r1, [r7, #4]
	adds r2, r1, #0
	lsls r1, r2, #4
	ldr r2, [r7, #8]
	adds r1, r1, r2
	adds r3, r1, #0
	lsls r2, r3, #1
	adds r2, r2, r1
	adds r1, r2, #2
	adds r0, r0, r1
	ldr r1, _080024A8 @ =0x02022860
	ldr r2, [r7, #4]
	adds r3, r2, #0
	lsls r2, r3, #4
	ldr r3, [r7, #8]
	adds r2, r2, r3
	adds r3, r2, #0
	lsls r2, r3, #1
	adds r1, r1, r2
	ldrh r2, [r1]
	lsrs r1, r2, #0xa
	adds r2, r1, #0
	movs r3, #0x1f
	adds r1, r2, #0
	ands r1, r3
	adds r2, r1, #0
	adds r1, r2, #0
	adds r1, #0x20
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	ldr r0, [r7, #8]
	adds r1, r0, #1
	str r1, [r7, #8]
	b _080023B8
	.align 2, 0
_080024A4: .4byte 0x02022260
_080024A8: .4byte 0x02022860
_080024AC:
	ldr r0, [r7, #4]
	subs r1, r0, #1
	str r1, [r7, #4]
	b _08002392
_080024B4:
	add sp, #0xc
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start sub_080024BC
sub_080024BC: @ 0x080024BC
	push {r7, lr}
	sub sp, #0xc
	mov r7, sp
	adds r1, r7, #0
	strb r0, [r1]
	movs r0, #0x1f
	str r0, [r7, #4]
_080024CA:
	ldr r0, [r7, #4]
	cmp r0, #0
	bge _080024D2
	b _080025DC
_080024D2:
	ldr r0, _080024F8 @ =0x02022240
	ldr r1, [r7, #4]
	adds r0, r0, r1
	adds r1, r7, #0
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	ldrb r1, [r1]
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	movs r0, #0
	str r0, [r7, #8]
_080024F0:
	ldr r0, [r7, #8]
	cmp r0, #0xf
	ble _080024FC
	b _080025D4
	.align 2, 0
_080024F8: .4byte 0x02022240
_080024FC:
	ldr r0, _080025CC @ =0x02022260
	ldr r1, [r7, #4]
	adds r2, r1, #0
	lsls r1, r2, #4
	ldr r2, [r7, #8]
	adds r1, r1, r2
	adds r3, r1, #0
	lsls r2, r3, #1
	adds r2, r2, r1
	adds r0, r0, r2
	ldr r1, _080025D0 @ =0x02022860
	ldr r2, [r7, #4]
	adds r3, r2, #0
	lsls r2, r3, #4
	ldr r3, [r7, #8]
	adds r2, r2, r3
	adds r3, r2, #0
	lsls r2, r3, #1
	adds r1, r1, r2
	ldrh r2, [r1]
	adds r1, r2, #0
	movs r2, #0x1f
	ands r1, r2
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	ldr r0, _080025CC @ =0x02022260
	ldr r1, [r7, #4]
	adds r2, r1, #0
	lsls r1, r2, #4
	ldr r2, [r7, #8]
	adds r1, r1, r2
	adds r3, r1, #0
	lsls r2, r3, #1
	adds r2, r2, r1
	adds r1, r2, #1
	adds r0, r0, r1
	ldr r1, _080025D0 @ =0x02022860
	ldr r2, [r7, #4]
	adds r3, r2, #0
	lsls r2, r3, #4
	ldr r3, [r7, #8]
	adds r2, r2, r3
	adds r3, r2, #0
	lsls r2, r3, #1
	adds r1, r1, r2
	ldrh r2, [r1]
	lsrs r1, r2, #5
	adds r2, r1, #0
	movs r3, #0x1f
	adds r1, r2, #0
	ands r1, r3
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	ldr r0, _080025CC @ =0x02022260
	ldr r1, [r7, #4]
	adds r2, r1, #0
	lsls r1, r2, #4
	ldr r2, [r7, #8]
	adds r1, r1, r2
	adds r3, r1, #0
	lsls r2, r3, #1
	adds r2, r2, r1
	adds r1, r2, #2
	adds r0, r0, r1
	ldr r1, _080025D0 @ =0x02022860
	ldr r2, [r7, #4]
	adds r3, r2, #0
	lsls r2, r3, #4
	ldr r3, [r7, #8]
	adds r2, r2, r3
	adds r3, r2, #0
	lsls r2, r3, #1
	adds r1, r1, r2
	ldrh r2, [r1]
	lsrs r1, r2, #0xa
	adds r2, r1, #0
	movs r3, #0x1f
	adds r1, r2, #0
	ands r1, r3
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	ldr r0, [r7, #8]
	adds r1, r0, #1
	str r1, [r7, #8]
	b _080024F0
	.align 2, 0
_080025CC: .4byte 0x02022260
_080025D0: .4byte 0x02022860
_080025D4:
	ldr r0, [r7, #4]
	subs r1, r0, #1
	str r1, [r7, #4]
	b _080024CA
_080025DC:
	add sp, #0xc
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start sub_080025E4
sub_080025E4: @ 0x080025E4
	push {r7, lr}
	sub sp, #0xc
	mov r7, sp
	adds r1, r7, #0
	strb r0, [r1]
	movs r0, #0x1f
	str r0, [r7, #4]
_080025F2:
	ldr r0, [r7, #4]
	cmp r0, #0
	bge _080025FA
	b _08002714
_080025FA:
	ldr r0, _08002620 @ =0x02022240
	ldr r1, [r7, #4]
	adds r0, r0, r1
	adds r1, r7, #0
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	ldrb r1, [r1]
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	movs r0, #0
	str r0, [r7, #8]
_08002618:
	ldr r0, [r7, #8]
	cmp r0, #0xf
	ble _08002624
	b _0800270C
	.align 2, 0
_08002620: .4byte 0x02022240
_08002624:
	ldr r0, _08002704 @ =0x02022260
	ldr r1, [r7, #4]
	adds r2, r1, #0
	lsls r1, r2, #4
	ldr r2, [r7, #8]
	adds r1, r1, r2
	adds r3, r1, #0
	lsls r2, r3, #1
	adds r2, r2, r1
	adds r0, r0, r2
	ldr r1, _08002708 @ =0x02022860
	ldr r2, [r7, #4]
	adds r3, r2, #0
	lsls r2, r3, #4
	ldr r3, [r7, #8]
	adds r2, r2, r3
	adds r3, r2, #0
	lsls r2, r3, #1
	adds r1, r1, r2
	ldrh r2, [r1]
	adds r1, r2, #0
	movs r2, #0x1f
	ands r1, r2
	adds r2, r1, #0
	adds r1, r2, #0
	adds r1, #0x20
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	ldr r0, _08002704 @ =0x02022260
	ldr r1, [r7, #4]
	adds r2, r1, #0
	lsls r1, r2, #4
	ldr r2, [r7, #8]
	adds r1, r1, r2
	adds r3, r1, #0
	lsls r2, r3, #1
	adds r2, r2, r1
	adds r1, r2, #1
	adds r0, r0, r1
	ldr r1, _08002708 @ =0x02022860
	ldr r2, [r7, #4]
	adds r3, r2, #0
	lsls r2, r3, #4
	ldr r3, [r7, #8]
	adds r2, r2, r3
	adds r3, r2, #0
	lsls r2, r3, #1
	adds r1, r1, r2
	ldrh r2, [r1]
	lsrs r1, r2, #5
	adds r2, r1, #0
	movs r3, #0x1f
	adds r1, r2, #0
	ands r1, r3
	adds r2, r1, #0
	adds r1, r2, #0
	adds r1, #0x20
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	ldr r0, _08002704 @ =0x02022260
	ldr r1, [r7, #4]
	adds r2, r1, #0
	lsls r1, r2, #4
	ldr r2, [r7, #8]
	adds r1, r1, r2
	adds r3, r1, #0
	lsls r2, r3, #1
	adds r2, r2, r1
	adds r1, r2, #2
	adds r0, r0, r1
	ldr r1, _08002708 @ =0x02022860
	ldr r2, [r7, #4]
	adds r3, r2, #0
	lsls r2, r3, #4
	ldr r3, [r7, #8]
	adds r2, r2, r3
	adds r3, r2, #0
	lsls r2, r3, #1
	adds r1, r1, r2
	ldrh r2, [r1]
	lsrs r1, r2, #0xa
	adds r2, r1, #0
	movs r3, #0x1f
	adds r1, r2, #0
	ands r1, r3
	adds r2, r1, #0
	adds r1, r2, #0
	adds r1, #0x20
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	ldr r0, [r7, #8]
	adds r1, r0, #1
	str r1, [r7, #8]
	b _08002618
	.align 2, 0
_08002704: .4byte 0x02022260
_08002708: .4byte 0x02022860
_0800270C:
	ldr r0, [r7, #4]
	subs r1, r0, #1
	str r1, [r7, #4]
	b _080025F2
_08002714:
	add sp, #0xc
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start sub_0800271C
sub_0800271C: @ 0x0800271C
	push {r7, lr}
	sub sp, #0xc
	mov r7, sp
	adds r1, r7, #0
	strb r0, [r1]
	movs r0, #0x1f
	str r0, [r7, #4]
_0800272A:
	ldr r0, [r7, #4]
	cmp r0, #0
	bge _08002732
	b _0800284C
_08002732:
	ldr r0, _08002758 @ =0x02022240
	ldr r1, [r7, #4]
	adds r0, r0, r1
	adds r1, r7, #0
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	ldrb r1, [r1]
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	movs r0, #0
	str r0, [r7, #8]
_08002750:
	ldr r0, [r7, #8]
	cmp r0, #0xf
	ble _0800275C
	b _08002844
	.align 2, 0
_08002758: .4byte 0x02022240
_0800275C:
	ldr r0, _0800283C @ =0x02022260
	ldr r1, [r7, #4]
	adds r2, r1, #0
	lsls r1, r2, #4
	ldr r2, [r7, #8]
	adds r1, r1, r2
	adds r3, r1, #0
	lsls r2, r3, #1
	adds r2, r2, r1
	adds r0, r0, r2
	ldr r1, _08002840 @ =0x02022860
	ldr r2, [r7, #4]
	adds r3, r2, #0
	lsls r2, r3, #4
	ldr r3, [r7, #8]
	adds r2, r2, r3
	adds r3, r2, #0
	lsls r2, r3, #1
	adds r1, r1, r2
	ldrh r2, [r1]
	adds r1, r2, #0
	movs r2, #0x1f
	ands r1, r2
	adds r2, r1, #0
	adds r1, r2, #0
	adds r1, #0x40
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	ldr r0, _0800283C @ =0x02022260
	ldr r1, [r7, #4]
	adds r2, r1, #0
	lsls r1, r2, #4
	ldr r2, [r7, #8]
	adds r1, r1, r2
	adds r3, r1, #0
	lsls r2, r3, #1
	adds r2, r2, r1
	adds r1, r2, #1
	adds r0, r0, r1
	ldr r1, _08002840 @ =0x02022860
	ldr r2, [r7, #4]
	adds r3, r2, #0
	lsls r2, r3, #4
	ldr r3, [r7, #8]
	adds r2, r2, r3
	adds r3, r2, #0
	lsls r2, r3, #1
	adds r1, r1, r2
	ldrh r2, [r1]
	lsrs r1, r2, #5
	adds r2, r1, #0
	movs r3, #0x1f
	adds r1, r2, #0
	ands r1, r3
	adds r2, r1, #0
	adds r1, r2, #0
	adds r1, #0x40
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	ldr r0, _0800283C @ =0x02022260
	ldr r1, [r7, #4]
	adds r2, r1, #0
	lsls r1, r2, #4
	ldr r2, [r7, #8]
	adds r1, r1, r2
	adds r3, r1, #0
	lsls r2, r3, #1
	adds r2, r2, r1
	adds r1, r2, #2
	adds r0, r0, r1
	ldr r1, _08002840 @ =0x02022860
	ldr r2, [r7, #4]
	adds r3, r2, #0
	lsls r2, r3, #4
	ldr r3, [r7, #8]
	adds r2, r2, r3
	adds r3, r2, #0
	lsls r2, r3, #1
	adds r1, r1, r2
	ldrh r2, [r1]
	lsrs r1, r2, #0xa
	adds r2, r1, #0
	movs r3, #0x1f
	adds r1, r2, #0
	ands r1, r3
	adds r2, r1, #0
	adds r1, r2, #0
	adds r1, #0x40
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	ldr r0, [r7, #8]
	adds r1, r0, #1
	str r1, [r7, #8]
	b _08002750
	.align 2, 0
_0800283C: .4byte 0x02022260
_08002840: .4byte 0x02022860
_08002844:
	ldr r0, [r7, #4]
	subs r1, r0, #1
	str r1, [r7, #4]
	b _0800272A
_0800284C:
	add sp, #0xc
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start sub_08002854
sub_08002854: @ 0x08002854
	push {r4, r7, lr}
	sub sp, #0x14
	mov r7, sp
	movs r0, #0x1f
	str r0, [r7]
_0800285E:
	ldr r0, [r7]
	cmp r0, #0
	bge _08002866
	b _08002A60
_08002866:
	ldr r0, _08002878 @ =0x02022240
	ldr r1, [r7]
	adds r0, r0, r1
	movs r1, #0
	ldrsb r1, [r0, r1]
	cmp r1, #0
	bne _0800287C
	b _08002A58
	.align 2, 0
_08002878: .4byte 0x02022240
_0800287C:
	movs r0, #0xf
	str r0, [r7, #4]
_08002880:
	ldr r0, [r7, #4]
	cmp r0, #0
	bge _08002888
	b _08002A58
_08002888:
	ldr r0, [r7]
	adds r1, r0, #0
	lsls r0, r1, #4
	ldr r1, [r7, #4]
	adds r0, r0, r1
	str r0, [r7, #0x10]
	ldr r0, _08002A4C @ =0x02022260
	ldr r1, [r7, #0x10]
	adds r3, r1, #0
	lsls r2, r3, #1
	adds r2, r2, r1
	adds r0, r0, r2
	ldr r1, _08002A4C @ =0x02022260
	ldr r2, [r7, #0x10]
	adds r4, r2, #0
	lsls r3, r4, #1
	adds r3, r3, r2
	adds r1, r1, r3
	ldr r2, _08002A50 @ =0x02022240
	ldr r3, [r7]
	adds r2, r2, r3
	ldrb r1, [r1]
	ldrb r2, [r2]
	adds r1, r1, r2
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	ldr r0, _08002A4C @ =0x02022260
	ldr r1, [r7, #0x10]
	adds r3, r1, #0
	lsls r2, r3, #1
	adds r2, r2, r1
	adds r1, r2, #1
	adds r0, r0, r1
	ldr r1, _08002A4C @ =0x02022260
	ldr r2, [r7, #0x10]
	adds r4, r2, #0
	lsls r3, r4, #1
	adds r3, r3, r2
	adds r2, r3, #1
	adds r1, r1, r2
	ldr r2, _08002A50 @ =0x02022240
	ldr r3, [r7]
	adds r2, r2, r3
	ldrb r1, [r1]
	ldrb r2, [r2]
	adds r1, r1, r2
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	ldr r0, _08002A4C @ =0x02022260
	ldr r1, [r7, #0x10]
	adds r3, r1, #0
	lsls r2, r3, #1
	adds r2, r2, r1
	adds r1, r2, #2
	adds r0, r0, r1
	ldr r1, _08002A4C @ =0x02022260
	ldr r2, [r7, #0x10]
	adds r4, r2, #0
	lsls r3, r4, #1
	adds r3, r3, r2
	adds r2, r3, #2
	adds r1, r1, r2
	ldr r2, _08002A50 @ =0x02022240
	ldr r3, [r7]
	adds r2, r2, r3
	ldrb r1, [r1]
	ldrb r2, [r2]
	adds r1, r1, r2
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	adds r0, r7, #0
	adds r0, #8
	ldr r1, _08002A4C @ =0x02022260
	ldr r2, [r7, #0x10]
	adds r4, r2, #0
	lsls r3, r4, #1
	adds r3, r3, r2
	adds r1, r1, r3
	movs r2, #0
	ldrsb r2, [r1, r2]
	adds r1, r2, #0
	adds r2, r1, #0
	subs r2, #0x20
	adds r1, r2, #0
	strh r1, [r0]
	adds r0, r7, #0
	adds r0, #8
	movs r2, #0
	ldrsh r1, [r0, r2]
	cmp r1, #0x1f
	ble _0800296A
	adds r0, r7, #0
	adds r0, #8
	movs r1, #0x1f
	strh r1, [r0]
_0800296A:
	adds r0, r7, #0
	adds r0, #8
	movs r2, #0
	ldrsh r1, [r0, r2]
	cmp r1, #0
	bge _0800297E
	adds r0, r7, #0
	adds r0, #8
	movs r1, #0
	strh r1, [r0]
_0800297E:
	adds r0, r7, #0
	adds r0, #0xa
	ldr r1, _08002A4C @ =0x02022260
	ldr r2, [r7, #0x10]
	adds r4, r2, #0
	lsls r3, r4, #1
	adds r3, r3, r2
	adds r2, r3, #1
	adds r1, r1, r2
	movs r2, #0
	ldrsb r2, [r1, r2]
	adds r1, r2, #0
	adds r2, r1, #0
	subs r2, #0x20
	adds r1, r2, #0
	strh r1, [r0]
	adds r0, r7, #0
	adds r0, #0xa
	movs r2, #0
	ldrsh r1, [r0, r2]
	cmp r1, #0x1f
	ble _080029B2
	adds r0, r7, #0
	adds r0, #0xa
	movs r1, #0x1f
	strh r1, [r0]
_080029B2:
	adds r0, r7, #0
	adds r0, #0xa
	movs r2, #0
	ldrsh r1, [r0, r2]
	cmp r1, #0
	bge _080029C6
	adds r0, r7, #0
	adds r0, #0xa
	movs r1, #0
	strh r1, [r0]
_080029C6:
	adds r0, r7, #0
	adds r0, #0xc
	ldr r1, _08002A4C @ =0x02022260
	ldr r2, [r7, #0x10]
	adds r4, r2, #0
	lsls r3, r4, #1
	adds r3, r3, r2
	adds r2, r3, #2
	adds r1, r1, r2
	movs r2, #0
	ldrsb r2, [r1, r2]
	adds r1, r2, #0
	adds r2, r1, #0
	subs r2, #0x20
	adds r1, r2, #0
	strh r1, [r0]
	adds r0, r7, #0
	adds r0, #0xc
	movs r2, #0
	ldrsh r1, [r0, r2]
	cmp r1, #0x1f
	ble _080029FA
	adds r0, r7, #0
	adds r0, #0xc
	movs r1, #0x1f
	strh r1, [r0]
_080029FA:
	adds r0, r7, #0
	adds r0, #0xc
	movs r2, #0
	ldrsh r1, [r0, r2]
	cmp r1, #0
	bge _08002A0E
	adds r0, r7, #0
	adds r0, #0xc
	movs r1, #0
	strh r1, [r0]
_08002A0E:
	ldr r0, _08002A54 @ =0x02022860
	ldr r1, [r7, #0x10]
	adds r2, r1, #0
	lsls r1, r2, #1
	adds r0, r0, r1
	adds r1, r7, #0
	adds r1, #0xc
	ldrh r2, [r1]
	lsls r1, r2, #0xa
	adds r2, r7, #0
	adds r2, #0xa
	ldrh r3, [r2]
	lsls r2, r3, #5
	adds r1, r1, r2
	adds r2, r7, #0
	adds r2, #8
	ldrh r2, [r2]
	adds r1, r1, r2
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
	ldr r0, [r7, #4]
	subs r1, r0, #1
	str r1, [r7, #4]
	b _08002880
	.align 2, 0
_08002A4C: .4byte 0x02022260
_08002A50: .4byte 0x02022240
_08002A54: .4byte 0x02022860
_08002A58:
	ldr r0, [r7]
	subs r1, r0, #1
	str r1, [r7]
	b _0800285E
_08002A60:
	bl EnablePalSync
	add sp, #0x14
	pop {r4, r7}
	pop {r0}
	bx r0

	thumb_func_start InitBgs
InitBgs: @ 0x08002A6C
	push {r4, r7, lr}
	sub sp, #0x24
	mov r7, sp
	str r0, [r7]
	adds r0, r7, #4
	adds r1, r7, #4
	ldr r2, _08002AB4 @ =0x080C59AC
	adds r0, r1, #0
	adds r1, r2, #0
	movs r2, #0x18
	bl memcpy
	ldr r0, [r7]
	cmp r0, #0
	bne _08002A8E
	adds r0, r7, #4
	str r0, [r7]
_08002A8E:
	ldr r0, _08002AB8 @ =0x0300287C
	movs r1, #0
	strh r1, [r0]
	ldr r0, _08002ABC @ =0x03002880
	movs r1, #0
	strh r1, [r0]
	ldr r0, _08002AC0 @ =0x03002884
	movs r1, #0
	strh r1, [r0]
	ldr r0, _08002AC4 @ =0x03002888
	movs r1, #0
	strh r1, [r0]
	movs r0, #0
	str r0, [r7, #0x1c]
_08002AAA:
	ldr r0, [r7, #0x1c]
	cmp r0, #3
	ble _08002AC8
	b _08002B40
	.align 2, 0
_08002AB4: .4byte 0x080C59AC
_08002AB8: .4byte 0x0300287C
_08002ABC: .4byte 0x03002880
_08002AC0: .4byte 0x03002884
_08002AC4: .4byte 0x03002888
_08002AC8:
	ldr r0, [r7, #0x1c]
	ldr r2, [r7]
	ldrh r1, [r2]
	adds r2, #2
	str r2, [r7]
	bl sub_08001434
	ldr r0, [r7, #0x1c]
	ldr r2, [r7]
	ldrh r1, [r2]
	adds r2, #2
	str r2, [r7]
	bl sub_08001478
	ldr r0, [r7, #0x1c]
	ldr r2, [r7]
	ldrh r1, [r2]
	adds r2, #2
	str r2, [r7]
	bl sub_080014DC
	ldr r1, [r7, #0x1c]
	adds r0, r1, #0
	lsls r2, r0, #0x10
	lsrs r1, r2, #0x10
	adds r0, r1, #0
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	ldr r1, [r7, #0x1c]
	adds r0, r1, #0
	bl sub_08002BE8
	adds r1, r0, #0
	adds r0, r1, #0
	movs r1, #0
	bl TmFill
	movs r0, #0
	str r0, [r7, #0x20]
	adds r4, r7, #0
	adds r4, #0x20
	ldr r1, [r7, #0x1c]
	adds r0, r1, #0
	bl GetBgChrOffset
	movs r2, #0xc0
	lsls r2, r2, #0x13
	adds r1, r0, r2
	ldr r2, _08002B3C @ =0x01000010
	adds r0, r4, #0
	bl CpuFastSet
	ldr r0, [r7, #0x1c]
	adds r1, r0, #1
	str r1, [r7, #0x1c]
	b _08002AAA
	.align 2, 0
_08002B3C: .4byte 0x01000010
_08002B40:
	bl sub_0801551C
	movs r0, #0xf
	bl EnableBgSync
	movs r0, #0
	bl sub_0800322C
	ldr r0, _08002BE0 @ =0x02022860
	ldrh r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0]
	bl EnablePalSync
	ldr r0, _08002BE4 @ =0x03002870
	ldrb r1, [r0]
	movs r2, #0x7f
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _08002BE4 @ =0x03002870
	ldrb r1, [r0]
	movs r2, #0xf8
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _08002BE4 @ =0x03002870
	ldrb r1, [r0, #1]
	movs r2, #0xdf
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0, #1]
	ldr r0, _08002BE4 @ =0x03002870
	ldrb r1, [r0, #1]
	movs r2, #0xbf
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0, #1]
	ldr r0, _08002BE4 @ =0x03002870
	ldrb r1, [r0, #1]
	movs r2, #0x7f
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0, #1]
	ldr r0, _08002BE4 @ =0x03002870
	ldrb r1, [r0, #1]
	movs r2, #1
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0, #1]
	ldr r0, _08002BE4 @ =0x03002870
	ldrb r1, [r0, #1]
	movs r2, #2
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0, #1]
	ldr r0, _08002BE4 @ =0x03002870
	ldrb r1, [r0, #1]
	movs r2, #4
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0, #1]
	ldr r0, _08002BE4 @ =0x03002870
	ldrb r1, [r0, #1]
	movs r2, #8
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0, #1]
	ldr r0, _08002BE4 @ =0x03002870
	ldrb r1, [r0, #1]
	movs r2, #0x10
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0, #1]
	add sp, #0x24
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08002BE0: .4byte 0x02022860
_08002BE4: .4byte 0x03002870

	thumb_func_start sub_08002BE8
sub_08002BE8: @ 0x08002BE8
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, _08002C00 @ =0x08B85814
	ldr r1, [r7]
	adds r2, r1, #0
	lsls r1, r2, #2
	adds r0, r0, r1
	ldr r1, [r0]
	adds r0, r1, #0
	b _08002C04
	.align 2, 0
_08002C00: .4byte 0x08B85814
_08002C04:
	add sp, #4
	pop {r7}
	pop {r1}
	bx r1

	thumb_func_start sub_08002C0C
sub_08002C0C: @ 0x08002C0C
	push {r7, lr}
	mov r7, sp
	ldr r0, _08002C18 @ =0x02024C8C
	ldr r1, [r0]
	adds r0, r1, #0
	b _08002C1C
	.align 2, 0
_08002C18: .4byte 0x02024C8C
_08002C1C:
	pop {r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_08002C24
sub_08002C24: @ 0x08002C24
	push {r7, lr}
	mov r7, sp
	ldr r0, _08002C30 @ =0x02024C90
	ldr r1, [r0]
	adds r0, r1, #0
	b _08002C34
	.align 2, 0
_08002C30: .4byte 0x02024C90
_08002C34:
	pop {r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_08002C3C
sub_08002C3C: @ 0x08002C3C
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, _08002C54 @ =0x02024C8C
	ldr r1, [r7]
	str r1, [r0]
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08002C54: .4byte 0x02024C8C

	thumb_func_start sub_08002C58
sub_08002C58: @ 0x08002C58
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, _08002C70 @ =0x02024C90
	ldr r1, [r7]
	str r1, [r0]
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08002C70: .4byte 0x02024C90

	thumb_func_start sub_08002C74
sub_08002C74: @ 0x08002C74
	push {r7, lr}
	mov r7, sp
	ldr r0, _08002C84 @ =0x02024C8C
	ldr r1, _08002C88 @ =0x3CC35AA5
	str r1, [r0]
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08002C84: .4byte 0x02024C8C
_08002C88: .4byte 0x3CC35AA5

	thumb_func_start sub_08002C8C
sub_08002C8C: @ 0x08002C8C
	push {r7, lr}
	mov r7, sp
	ldr r0, _08002C9C @ =0x02024C90
	ldr r1, _08002CA0 @ =0x3CC35AA5
	str r1, [r0]
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08002C9C: .4byte 0x02024C90
_08002CA0: .4byte 0x3CC35AA5

	thumb_func_start sub_08002CA4
sub_08002CA4: @ 0x08002CA4
	push {r7, lr}
	mov r7, sp
	ldr r0, _08002CB8 @ =0x02024C8C
	ldr r1, [r0]
	ldr r0, _08002CBC @ =0x3CC35AA5
	cmp r1, r0
	beq _08002CC0
	movs r0, #0
	b _08002CC4
	.align 2, 0
_08002CB8: .4byte 0x02024C8C
_08002CBC: .4byte 0x3CC35AA5
_08002CC0:
	movs r0, #1
	b _08002CC4
_08002CC4:
	pop {r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_08002CCC
sub_08002CCC: @ 0x08002CCC
	push {r7, lr}
	mov r7, sp
	ldr r0, _08002CE0 @ =0x02024C90
	ldr r1, [r0]
	ldr r0, _08002CE4 @ =0x3CC35AA5
	cmp r1, r0
	beq _08002CE8
	movs r0, #0
	b _08002CEC
	.align 2, 0
_08002CE0: .4byte 0x02024C90
_08002CE4: .4byte 0x3CC35AA5
_08002CE8:
	movs r0, #1
	b _08002CEC
_08002CEC:
	pop {r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start SoftResetIfKeyCombo
SoftResetIfKeyCombo: @ 0x08002CF4
	push {r7, lr}
	mov r7, sp
	bl sub_08002CA4
	lsls r1, r0, #0x18
	asrs r0, r1, #0x18
	cmp r0, #0
	beq _08002D40
	ldr r1, _08002D1C @ =0x08B857F8
	ldr r0, [r1]
	ldrh r1, [r0, #4]
	ldr r0, _08002D20 @ =0x00000303
	cmp r1, r0
	bne _08002D24
	bl sub_08002C8C
	movs r0, #0xfe
	bl sub_080BFA40
	b _08002D40
	.align 2, 0
_08002D1C: .4byte 0x08B857F8
_08002D20: .4byte 0x00000303
_08002D24:
	ldr r1, _08002D3C @ =0x08B857F8
	ldr r0, [r1]
	ldrh r1, [r0, #4]
	cmp r1, #0xf
	bne _08002D40
	bl sub_08002C8C
	movs r0, #0xfe
	bl sub_080BFA40
	b _08002D40
	.align 2, 0
_08002D3C: .4byte 0x08B857F8
_08002D40:
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_08002D48
sub_08002D48: @ 0x08002D48
	push {r7, lr}
	sub sp, #8
	mov r7, sp
	str r0, [r7]
	adds r0, r7, #4
	ldr r1, _08002DB8 @ =0x04000200
	ldrh r2, [r1]
	strh r2, [r0]
	ldr r0, _08002DBC @ =0x04000132
	ldr r2, [r7]
	adds r1, r2, #0
	ldr r3, _08002DC0 @ =0xFFFFC000
	adds r2, r1, r3
	adds r1, r2, #0
	strh r1, [r0]
	ldr r0, _08002DB8 @ =0x04000200
	ldr r1, _08002DB8 @ =0x04000200
	ldrh r2, [r1]
	ldr r3, _08002DC4 @ =0x0000DF7F
	adds r1, r2, #0
	ands r1, r3
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, _08002DB8 @ =0x04000200
	ldr r1, _08002DB8 @ =0x04000200
	ldrh r2, [r1]
	movs r3, #0x80
	lsls r3, r3, #5
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0]
	movs r0, #0x80
	lsls r0, r0, #0x13
	movs r1, #0x80
	lsls r1, r1, #0x13
	ldrh r2, [r1]
	movs r3, #0x80
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0]
	bl sub_080BFA58
	svc #3
	bl sub_080BFA60
	ldr r0, _08002DB8 @ =0x04000200
	adds r1, r7, #4
	ldrh r2, [r1]
	strh r2, [r0]
	add sp, #8
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08002DB8: .4byte 0x04000200
_08002DBC: .4byte 0x04000132
_08002DC0: .4byte 0xFFFFC000
_08002DC4: .4byte 0x0000DF7F

	thumb_func_start OnHBlankBoth
OnHBlankBoth: @ 0x08002DC8
	push {r4, r7, lr}
	mov r7, sp
	ldr r0, _08002DF4 @ =0x03002924
	ldr r1, [r0]
	cmp r1, #0
	beq _08002DDC
	ldr r0, _08002DF4 @ =0x03002924
	ldr r4, [r0]
	bl _call_via_r4
_08002DDC:
	ldr r0, _08002DF8 @ =0x03002F38
	ldr r1, [r0]
	cmp r1, #0
	beq _08002DEC
	ldr r0, _08002DF8 @ =0x03002F38
	ldr r4, [r0]
	bl _call_via_r4
_08002DEC:
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08002DF4: .4byte 0x03002924
_08002DF8: .4byte 0x03002F38

	thumb_func_start RefreshOnHBlank
RefreshOnHBlank: @ 0x08002DFC
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	movs r0, #0
	str r0, [r7]
	ldr r0, _08002E34 @ =0x03002924
	ldr r1, [r0]
	cmp r1, #0
	beq _08002E14
	ldr r0, [r7]
	adds r1, r0, #1
	str r1, [r7]
_08002E14:
	ldr r0, _08002E38 @ =0x03002F38
	ldr r1, [r0]
	cmp r1, #0
	beq _08002E22
	ldr r0, [r7]
	adds r1, r0, #2
	str r1, [r7]
_08002E22:
	ldr r0, [r7]
	cmp r0, #1
	beq _08002E70
	cmp r0, #1
	bgt _08002E3C
	cmp r0, #0
	beq _08002E46
	b _08002F0C
	.align 2, 0
_08002E34: .4byte 0x03002924
_08002E38: .4byte 0x03002F38
_08002E3C:
	cmp r0, #2
	beq _08002EA4
	cmp r0, #3
	beq _08002ED8
	b _08002F0C
_08002E46:
	ldr r0, _08002E64 @ =0x03002870
	ldrb r1, [r0, #4]
	movs r2, #0xef
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0, #4]
	ldr r0, _08002E68 @ =0x04000200
	ldr r1, _08002E68 @ =0x04000200
	ldrh r2, [r1]
	ldr r3, _08002E6C @ =0x0000FFFD
	adds r1, r2, #0
	ands r1, r3
	adds r2, r1, #0
	strh r2, [r0]
	b _08002F0C
	.align 2, 0
_08002E64: .4byte 0x03002870
_08002E68: .4byte 0x04000200
_08002E6C: .4byte 0x0000FFFD
_08002E70:
	ldr r0, _08002E98 @ =0x03002870
	ldrb r1, [r0, #4]
	movs r2, #0x10
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0, #4]
	ldr r0, _08002E9C @ =0x03002924
	ldr r1, [r0]
	movs r0, #1
	bl SetIrqFunc
	ldr r0, _08002EA0 @ =0x04000200
	ldr r1, _08002EA0 @ =0x04000200
	ldrh r2, [r1]
	movs r3, #2
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0]
	b _08002F0C
	.align 2, 0
_08002E98: .4byte 0x03002870
_08002E9C: .4byte 0x03002924
_08002EA0: .4byte 0x04000200
_08002EA4:
	ldr r0, _08002ECC @ =0x03002870
	ldrb r1, [r0, #4]
	movs r2, #0x10
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0, #4]
	ldr r0, _08002ED0 @ =0x03002F38
	ldr r1, [r0]
	movs r0, #1
	bl SetIrqFunc
	ldr r0, _08002ED4 @ =0x04000200
	ldr r1, _08002ED4 @ =0x04000200
	ldrh r2, [r1]
	movs r3, #2
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0]
	b _08002F0C
	.align 2, 0
_08002ECC: .4byte 0x03002870
_08002ED0: .4byte 0x03002F38
_08002ED4: .4byte 0x04000200
_08002ED8:
	ldr r0, _08002F00 @ =0x03002870
	ldrb r1, [r0, #4]
	movs r2, #0x10
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0, #4]
	ldr r1, _08002F04 @ =OnHBlankBoth
	movs r0, #1
	bl SetIrqFunc
	ldr r0, _08002F08 @ =0x04000200
	ldr r1, _08002F08 @ =0x04000200
	ldrh r2, [r1]
	movs r3, #2
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0]
	b _08002F0C
	.align 2, 0
_08002F00: .4byte 0x03002870
_08002F04: .4byte OnHBlankBoth
_08002F08: .4byte 0x04000200
_08002F0C:
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start SetOnHBlankA
SetOnHBlankA: @ 0x08002F14
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, _08002F30 @ =0x03002924
	ldr r1, [r7]
	str r1, [r0]
	bl RefreshOnHBlank
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08002F30: .4byte 0x03002924

	thumb_func_start SetOnHBlankB
SetOnHBlankB: @ 0x08002F34
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, _08002F50 @ =0x03002F38
	ldr r1, [r7]
	str r1, [r0]
	bl RefreshOnHBlank
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08002F50: .4byte 0x03002F38

	thumb_func_start sub_08002F54
sub_08002F54: @ 0x08002F54
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, [r7]
	ldr r1, _08002F70 @ =0x02022C60
	cmp r0, r1
	blo _08002F78
	ldr r0, [r7]
	ldr r1, _08002F74 @ =0x02023460
	cmp r0, r1
	bhs _08002F78
	movs r0, #0
	b _08002FD2
	.align 2, 0
_08002F70: .4byte 0x02022C60
_08002F74: .4byte 0x02023460
_08002F78:
	ldr r0, [r7]
	ldr r1, _08002F8C @ =0x02023460
	cmp r0, r1
	blo _08002F94
	ldr r0, [r7]
	ldr r1, _08002F90 @ =0x02023C60
	cmp r0, r1
	bhs _08002F94
	movs r0, #1
	b _08002FD2
	.align 2, 0
_08002F8C: .4byte 0x02023460
_08002F90: .4byte 0x02023C60
_08002F94:
	ldr r0, [r7]
	ldr r1, _08002FA8 @ =0x02023C60
	cmp r0, r1
	blo _08002FB0
	ldr r0, [r7]
	ldr r1, _08002FAC @ =0x02024460
	cmp r0, r1
	bhs _08002FB0
	movs r0, #2
	b _08002FD2
	.align 2, 0
_08002FA8: .4byte 0x02023C60
_08002FAC: .4byte 0x02024460
_08002FB0:
	ldr r0, [r7]
	ldr r1, _08002FC4 @ =0x02024460
	cmp r0, r1
	blo _08002FCC
	ldr r0, [r7]
	ldr r1, _08002FC8 @ =0x02024C60
	cmp r0, r1
	bhs _08002FCC
	movs r0, #3
	b _08002FD2
	.align 2, 0
_08002FC4: .4byte 0x02024460
_08002FC8: .4byte 0x02024C60
_08002FCC:
	movs r0, #1
	rsbs r0, r0, #0
	b _08002FD2
_08002FD2:
	add sp, #4
	pop {r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_08002FDC
sub_08002FDC: @ 0x08002FDC
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	ldr r0, _08002FFC @ =0x02024C94
	movs r1, #0
	str r1, [r0]
	ldr r0, _08002FFC @ =0x02024C94
	movs r1, #0
	str r1, [r0, #4]
	movs r0, #0
	str r0, [r7]
_08002FF2:
	ldr r0, [r7]
	cmp r0, #0x1f
	ble _08003000
	b _08003064
	.align 2, 0
_08002FFC: .4byte 0x02024C94
_08003000:
	ldr r0, _08003060 @ =0x02024C9C
	ldr r1, [r7]
	adds r3, r1, #0
	lsls r2, r3, #1
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, r0, r1
	movs r1, #0
	str r1, [r0]
	ldr r0, _08003060 @ =0x02024C9C
	ldr r1, [r7]
	adds r3, r1, #0
	lsls r2, r3, #1
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, #4
	adds r1, r0, r1
	movs r0, #0
	str r0, [r1]
	ldr r0, _08003060 @ =0x02024C9C
	ldr r1, [r7]
	adds r3, r1, #0
	lsls r2, r3, #1
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, r0, r1
	ldrh r1, [r0, #8]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0, #8]
	ldr r0, _08003060 @ =0x02024C9C
	ldr r1, [r7]
	adds r3, r1, #0
	lsls r2, r3, #1
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, r0, r1
	ldrh r1, [r0, #0xa]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0, #0xa]
	ldr r0, [r7]
	adds r1, r0, #1
	str r1, [r7]
	b _08002FF2
	.align 2, 0
_08003060: .4byte 0x02024C9C
_08003064:
	ldr r0, _08003074 @ =0x02024C9C
	movs r1, #0
	str r1, [r0]
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08003074: .4byte 0x02024C9C

	thumb_func_start sub_08003078
sub_08003078: @ 0x08003078
	push {r7, lr}
	sub sp, #0x10
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
	ldr r1, _080030F4 @ =0x02024C94
	ldr r0, [r1]
	adds r2, r0, #0
	lsls r1, r2, #1
	adds r1, r1, r0
	lsls r0, r1, #2
	ldr r1, _080030F8 @ =0x02024C9C
	adds r0, r1, r0
	str r0, [r7, #0xc]
	ldr r0, [r7, #0xc]
	ldr r1, [r7]
	str r1, [r0]
	ldr r0, [r7, #0xc]
	ldr r1, [r7, #4]
	str r1, [r0, #4]
	ldr r0, [r7, #0xc]
	ldr r2, [r7, #8]
	adds r1, r2, #0
	ldrh r2, [r0, #8]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0, #8]
	ldr r0, [r7, #0xc]
	movs r1, #0
	ldr r2, [r7, #8]
	movs r3, #0x1f
	ands r2, r3
	cmp r2, #0
	bne _080030C6
	movs r1, #1
_080030C6:
	ldrh r2, [r0, #0xa]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0, #0xa]
	ldr r0, _080030F4 @ =0x02024C94
	ldr r1, _080030F4 @ =0x02024C94
	ldr r2, [r1, #4]
	ldr r1, [r7, #8]
	adds r2, r2, r1
	str r2, [r0, #4]
	ldr r1, _080030F4 @ =0x02024C94
	ldr r0, _080030F4 @ =0x02024C94
	ldr r1, _080030F4 @ =0x02024C94
	ldr r2, [r1]
	adds r1, r2, #1
	str r1, [r0]
	add sp, #0x10
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_080030F4: .4byte 0x02024C94
_080030F8: .4byte 0x02024C9C

	thumb_func_start sub_080030FC
sub_080030FC: @ 0x080030FC
	push {r7, lr}
	sub sp, #0x10
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
	ldr r1, _08003170 @ =0x02024C94
	ldr r0, [r1]
	adds r2, r0, #0
	lsls r1, r2, #1
	adds r1, r1, r0
	lsls r0, r1, #2
	ldr r1, _08003174 @ =0x02024C9C
	adds r0, r1, r0
	str r0, [r7, #0xc]
	ldr r0, [r7, #0xc]
	ldr r1, [r7]
	str r1, [r0]
	ldr r0, [r7, #0xc]
	ldr r1, [r7, #4]
	str r1, [r0, #4]
	ldr r0, [r7, #0xc]
	ldr r2, [r7, #8]
	adds r1, r2, #0
	ldrh r2, [r0, #8]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0, #8]
	ldr r0, [r7, #0xc]
	ldrh r1, [r0, #0xa]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #2
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0, #0xa]
	ldr r0, _08003170 @ =0x02024C94
	ldr r1, _08003170 @ =0x02024C94
	ldr r2, [r1, #4]
	ldr r1, [r7, #8]
	adds r2, r2, r1
	str r2, [r0, #4]
	ldr r1, _08003170 @ =0x02024C94
	ldr r0, _08003170 @ =0x02024C94
	ldr r1, _08003170 @ =0x02024C94
	ldr r2, [r1]
	adds r1, r2, #1
	str r1, [r0]
	add sp, #0x10
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08003170: .4byte 0x02024C94
_08003174: .4byte 0x02024C9C

	thumb_func_start sub_08003178
sub_08003178: @ 0x08003178
	push {r4, r7, lr}
	sub sp, #0xc
	mov r7, sp
	ldr r0, _08003194 @ =0x02024C9C
	str r0, [r7]
	movs r0, #0
	str r0, [r7, #4]
_08003186:
	ldr r0, _08003198 @ =0x02024C94
	ldr r1, [r7, #4]
	ldr r0, [r0]
	cmp r1, r0
	blt _0800319C
	b _0800321E
	.align 2, 0
_08003194: .4byte 0x02024C9C
_08003198: .4byte 0x02024C94
_0800319C:
	ldr r1, [r7]
	ldrh r0, [r1, #0xa]
	cmp r0, #1
	beq _080031CE
	cmp r0, #1
	bgt _080031AE
	cmp r0, #0
	beq _080031B4
	b _0800320E
_080031AE:
	cmp r0, #2
	beq _080031E8
	b _0800320E
_080031B4:
	ldr r1, [r7]
	ldr r0, [r1]
	ldr r2, [r7]
	ldr r1, [r2, #4]
	ldr r2, [r7]
	ldrh r3, [r2, #8]
	lsrs r2, r3, #1
	adds r4, r2, #0
	lsls r3, r4, #0x10
	lsrs r2, r3, #0x10
	bl CpuSet
	b _0800320E
_080031CE:
	ldr r1, [r7]
	ldr r0, [r1]
	ldr r2, [r7]
	ldr r1, [r2, #4]
	ldr r2, [r7]
	ldrh r3, [r2, #8]
	lsrs r2, r3, #2
	adds r4, r2, #0
	lsls r3, r4, #0x10
	lsrs r2, r3, #0x10
	bl CpuFastSet
	b _0800320E
_080031E8:
	ldr r0, [r7]
	ldr r1, [r0]
	str r1, [r7, #8]
	adds r0, r7, #0
	adds r0, #8
	ldr r2, [r7]
	ldr r1, [r2, #4]
	ldr r2, [r7]
	ldrh r3, [r2, #8]
	lsrs r2, r3, #2
	adds r4, r2, #0
	lsls r3, r4, #0x10
	lsrs r2, r3, #0x10
	movs r3, #0x80
	lsls r3, r3, #0x11
	orrs r2, r3
	bl CpuFastSet
	b _0800320E
_0800320E:
	ldr r0, [r7]
	adds r1, r0, #0
	adds r1, #0xc
	str r1, [r7]
	ldr r0, [r7, #4]
	adds r1, r0, #1
	str r1, [r7, #4]
	b _08003186
_0800321E:
	bl sub_08002FDC
	add sp, #0xc
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0800322C
sub_0800322C: @ 0x0800322C
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, _080032BC @ =0x03000028
	ldr r1, _080032C0 @ =0x03002930
	str r1, [r0]
	ldr r0, _080032BC @ =0x03000028
	movs r1, #0xe0
	lsls r1, r1, #0x13
	str r1, [r0, #4]
	ldr r0, _080032BC @ =0x03000028
	ldrh r1, [r0, #8]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0, #8]
	ldr r0, _080032BC @ =0x03000028
	ldr r2, [r7]
	adds r1, r2, #0
	ldrh r2, [r0, #0xa]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0, #0xa]
	ldr r0, _080032C4 @ =0x03000018
	ldr r1, [r7]
	adds r2, r1, #0
	lsls r1, r2, #3
	ldr r2, _080032C0 @ =0x03002930
	adds r1, r2, r1
	str r1, [r0]
	ldr r0, _080032C4 @ =0x03000018
	ldr r1, [r7]
	adds r2, r1, #0
	lsls r1, r2, #3
	movs r3, #0xe0
	lsls r3, r3, #0x13
	adds r2, r1, r3
	str r2, [r0, #4]
	ldr r0, _080032C4 @ =0x03000018
	ldr r1, [r7]
	adds r2, r1, #0
	lsls r1, r2, #3
	ldrh r2, [r0, #8]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0, #8]
	ldr r0, _080032C4 @ =0x03000018
	ldr r2, [r7]
	adds r1, r2, #0
	movs r2, #0x80
	subs r1, r2, r1
	ldrh r2, [r0, #0xa]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0, #0xa]
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_080032BC: .4byte 0x03000028
_080032C0: .4byte 0x03002930
_080032C4: .4byte 0x03000018

	thumb_func_start sub_080032C8
sub_080032C8: @ 0x080032C8
	push {r7, lr}
	mov r7, sp
	ldr r0, _080032D4 @ =0x03000028
	ldrh r1, [r0, #0xa]
	adds r0, r1, #0
	b _080032D8
	.align 2, 0
_080032D4: .4byte 0x03000028
_080032D8:
	pop {r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_080032E0
sub_080032E0: @ 0x080032E0
	push {r4, r7, lr}
	mov r7, sp
	ldr r1, _08003324 @ =0x03000018
	ldr r0, [r1]
	ldr r2, _08003324 @ =0x03000018
	ldr r1, [r2, #4]
	ldr r2, _08003324 @ =0x03000018
	ldrh r3, [r2, #0xa]
	adds r2, r3, #0
	lsls r3, r2, #1
	lsls r4, r3, #0xb
	lsrs r2, r4, #0xb
	bl CpuFastSet
	ldr r1, _08003324 @ =0x03000018
	ldr r0, [r1]
	ldr r1, _08003324 @ =0x03000018
	ldrh r2, [r1, #0xa]
	adds r1, r2, #0
	bl ClearOam_t
	ldr r0, _08003328 @ =0x03002F34
	ldr r1, _08003324 @ =0x03000018
	ldr r2, [r1]
	str r2, [r0]
	ldr r0, _0800332C @ =0x03003948
	ldr r1, _08003330 @ =0x03002930
	str r1, [r0]
	ldr r0, _08003334 @ =0x0300291C
	movs r1, #0
	strh r1, [r0]
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08003324: .4byte 0x03000018
_08003328: .4byte 0x03002F34
_0800332C: .4byte 0x03003948
_08003330: .4byte 0x03002930
_08003334: .4byte 0x0300291C

	thumb_func_start sub_08003338
sub_08003338: @ 0x08003338
	push {r4, r7, lr}
	mov r7, sp
	ldr r0, _08003348 @ =0x03000028
	ldrh r1, [r0, #0xa]
	cmp r1, #0
	bne _0800334C
	b _0800337A
	.align 2, 0
_08003348: .4byte 0x03000028
_0800334C:
	ldr r1, _08003380 @ =0x03000028
	ldr r0, [r1]
	ldr r2, _08003380 @ =0x03000028
	ldr r1, [r2, #4]
	ldr r2, _08003380 @ =0x03000028
	ldrh r3, [r2, #0xa]
	adds r2, r3, #0
	lsls r3, r2, #1
	lsls r4, r3, #0xb
	lsrs r2, r4, #0xb
	bl CpuFastSet
	ldr r1, _08003380 @ =0x03000028
	ldr r0, [r1]
	ldr r1, _08003380 @ =0x03000028
	ldrh r2, [r1, #0xa]
	adds r1, r2, #0
	bl ClearOam_t
	ldr r0, _08003384 @ =0x03002860
	ldr r1, _08003380 @ =0x03000028
	ldr r2, [r1]
	str r2, [r0]
_0800337A:
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08003380: .4byte 0x03000028
_08003384: .4byte 0x03002860

	thumb_func_start sub_08003388
sub_08003388: @ 0x08003388
	push {r4, r7, lr}
	sub sp, #0xc
	mov r7, sp
	str r0, [r7]
	adds r4, r1, #0
	adds r1, r3, #0
	ldr r0, [r7, #0x18]
	adds r3, r7, #4
	strh r4, [r3]
	adds r3, r7, #6
	strh r2, [r3]
	adds r2, r7, #0
	adds r2, #8
	strh r1, [r2]
	adds r1, r7, #0
	adds r1, #0xa
	strh r0, [r1]
	ldr r0, _0800344C @ =0x03002930
	ldr r1, [r7]
	adds r2, r1, #0
	lsls r1, r2, #4
	adds r2, r1, #3
	adds r1, r2, #0
	lsls r2, r1, #1
	adds r0, r0, r2
	adds r1, r7, #4
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	ldrh r1, [r1]
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
	ldr r0, _0800344C @ =0x03002930
	ldr r1, [r7]
	adds r2, r1, #0
	lsls r1, r2, #4
	adds r2, r1, #7
	adds r1, r2, #0
	lsls r2, r1, #1
	adds r0, r0, r2
	adds r1, r7, #6
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	ldrh r1, [r1]
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
	ldr r0, _0800344C @ =0x03002930
	ldr r1, [r7]
	adds r2, r1, #0
	lsls r1, r2, #4
	adds r2, r1, #0
	adds r2, #0xb
	adds r1, r2, #0
	lsls r2, r1, #1
	adds r0, r0, r2
	adds r1, r7, #0
	adds r1, #8
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	ldrh r1, [r1]
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
	ldr r0, _0800344C @ =0x03002930
	ldr r1, [r7]
	adds r2, r1, #0
	lsls r1, r2, #4
	adds r2, r1, #0
	adds r2, #0xf
	adds r1, r2, #0
	lsls r2, r1, #1
	adds r0, r0, r2
	adds r1, r7, #0
	adds r1, #0xa
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	ldrh r1, [r1]
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
	add sp, #0xc
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800344C: .4byte 0x03002930

	thumb_func_start sub_08003450
sub_08003450: @ 0x08003450
	push {r4, r7, lr}
	sub sp, #0x14
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
_0800345C:
	b _08003460
_0800345E:
	.byte 0x39, 0xE0
_08003460:
	ldr r0, [r7]
	ldr r1, [r0]
	cmp r1, #1
	beq _0800347C
	ldr r0, _08003474 @ =0x03002F34
	ldr r1, [r0]
	ldr r0, _08003478 @ =0x03002A30
	cmp r1, r0
	bhs _0800347C
	b _0800347E
	.align 2, 0
_08003474: .4byte 0x03002F34
_08003478: .4byte 0x03002A30
_0800347C:
	b _080034D4
_0800347E:
	ldr r0, [r7]
	movs r2, #6
	ldrsh r1, [r0, r2]
	ldr r2, [r7, #4]
	adds r0, r1, r2
	lsls r1, r0, #0x17
	lsrs r0, r1, #0x17
	str r0, [r7, #0xc]
	ldr r0, [r7]
	movs r2, #8
	ldrsh r1, [r0, r2]
	ldr r2, [r7, #8]
	adds r0, r1, r2
	movs r1, #0xff
	ands r0, r1
	str r0, [r7, #0x10]
	ldr r0, _080034D0 @ =0x03002F34
	ldr r1, [r0]
	ldr r2, [r7]
	ldr r4, [r7, #0xc]
	lsls r3, r4, #0x10
	ldr r4, [r2]
	adds r2, r3, #0
	orrs r2, r4
	ldr r3, [r7, #0x10]
	orrs r2, r3
	str r2, [r1]
	adds r1, #4
	str r1, [r0]
	ldr r0, _080034D0 @ =0x03002F34
	ldr r1, [r0]
	ldr r2, [r7]
	ldrh r3, [r2, #4]
	strh r3, [r1]
	adds r1, #4
	str r1, [r0]
	ldr r0, [r7]
	adds r1, r0, #0
	adds r1, #0xc
	str r1, [r7]
	b _0800345C
	.align 2, 0
_080034D0: .4byte 0x03002F34
_080034D4:
	add sp, #0x14
	pop {r4, r7}
	pop {r0}
	bx r0

	thumb_func_start GetCurrentBgmSong
GetCurrentBgmSong: @ 0x080034DC
	push {r7, lr}
	mov r7, sp
	ldr r0, _080034E8 @ =0x02024E1C
	ldrh r1, [r0, #4]
	adds r0, r1, #0
	b _080034EC
	.align 2, 0
_080034E8: .4byte 0x02024E1C
_080034EC:
	pop {r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_080034F4
sub_080034F4: @ 0x080034F4
	push {r7, lr}
	mov r7, sp
	ldr r0, _08003504 @ =0x02024E1C
	movs r1, #6
	ldrsb r1, [r0, r1]
	adds r0, r1, #0
	b _08003508
	.align 2, 0
_08003504: .4byte 0x02024E1C
_08003508:
	pop {r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_08003510
sub_08003510: @ 0x08003510
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, _08003590 @ =0x03005D60
	ldr r1, _08003594 @ =0x0000FFFF
	ldr r3, [r7]
	adds r2, r3, #0
	lsls r3, r2, #0x10
	lsrs r2, r3, #0x10
	bl m4aMPlayVolumeControl
	ldr r0, _08003598 @ =0x03005E30
	ldr r1, _08003594 @ =0x0000FFFF
	ldr r3, [r7]
	adds r2, r3, #0
	lsls r3, r2, #0x10
	lsrs r2, r3, #0x10
	bl m4aMPlayVolumeControl
	ldr r0, _0800359C @ =0x03005DA0
	ldr r1, _08003594 @ =0x0000FFFF
	ldr r3, [r7]
	adds r2, r3, #0
	lsls r3, r2, #0x10
	lsrs r2, r3, #0x10
	bl m4aMPlayVolumeControl
	ldr r0, _080035A0 @ =0x03005A90
	ldr r1, _08003594 @ =0x0000FFFF
	ldr r3, [r7]
	adds r2, r3, #0
	lsls r3, r2, #0x10
	lsrs r2, r3, #0x10
	bl m4aMPlayVolumeControl
	ldr r0, _080035A4 @ =0x03005AD0
	ldr r1, _08003594 @ =0x0000FFFF
	ldr r3, [r7]
	adds r2, r3, #0
	lsls r3, r2, #0x10
	lsrs r2, r3, #0x10
	bl m4aMPlayVolumeControl
	ldr r0, _080035A8 @ =0x03005CE0
	ldr r1, _08003594 @ =0x0000FFFF
	ldr r3, [r7]
	adds r2, r3, #0
	lsls r3, r2, #0x10
	lsrs r2, r3, #0x10
	bl m4aMPlayVolumeControl
	ldr r0, _080035AC @ =0x03005DF0
	ldr r1, _08003594 @ =0x0000FFFF
	ldr r3, [r7]
	adds r2, r3, #0
	lsls r3, r2, #0x10
	lsrs r2, r3, #0x10
	bl m4aMPlayVolumeControl
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08003590: .4byte 0x03005D60
_08003594: .4byte 0x0000FFFF
_08003598: .4byte 0x03005E30
_0800359C: .4byte 0x03005DA0
_080035A0: .4byte 0x03005A90
_080035A4: .4byte 0x03005AD0
_080035A8: .4byte 0x03005CE0
_080035AC: .4byte 0x03005DF0

	thumb_func_start SetBgmVolume
SetBgmVolume: @ 0x080035B0
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, _080035E0 @ =0x03005B10
	ldr r1, _080035E4 @ =0x0000FFFF
	ldr r3, [r7]
	adds r2, r3, #0
	lsls r3, r2, #0x10
	lsrs r2, r3, #0x10
	bl m4aMPlayVolumeControl
	ldr r0, _080035E8 @ =0x03005D20
	ldr r1, _080035E4 @ =0x0000FFFF
	ldr r3, [r7]
	adds r2, r3, #0
	lsls r3, r2, #0x10
	lsrs r2, r3, #0x10
	bl m4aMPlayVolumeControl
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_080035E0: .4byte 0x03005B10
_080035E4: .4byte 0x0000FFFF
_080035E8: .4byte 0x03005D20

	thumb_func_start FadeBgmOut
FadeBgmOut: @ 0x080035EC
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, [r7]
	cmp r0, #0
	bge _080035FE
	movs r0, #6
	str r0, [r7]
_080035FE:
	ldr r0, _08003660 @ =0x03000038
	ldr r1, [r0]
	cmp r1, #0
	beq _08003616
	ldr r0, _08003660 @ =0x03000038
	ldr r1, [r0]
	adds r0, r1, #0
	bl Proc_Break
	ldr r0, _08003660 @ =0x03000038
	movs r1, #0
	str r1, [r0]
_08003616:
	ldr r0, _08003664 @ =0x0300003C
	ldr r1, [r0]
	cmp r1, #0
	beq _0800362E
	ldr r0, _08003664 @ =0x0300003C
	ldr r1, [r0]
	adds r0, r1, #0
	bl Proc_Break
	ldr r0, _08003664 @ =0x0300003C
	movs r1, #0
	str r1, [r0]
_0800362E:
	ldr r0, _08003668 @ =0x03005B10
	ldr r2, [r7]
	adds r1, r2, #0
	lsls r2, r1, #0x10
	lsrs r1, r2, #0x10
	bl m4aMPlayFadeOut
	ldr r0, _0800366C @ =0x03005D20
	ldr r2, [r7]
	adds r1, r2, #0
	lsls r2, r1, #0x10
	lsrs r1, r2, #0x10
	bl m4aMPlayFadeOut
	ldr r0, _08003670 @ =0x02024E1C
	ldrb r1, [r0, #6]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0, #6]
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08003660: .4byte 0x03000038
_08003664: .4byte 0x0300003C
_08003668: .4byte 0x03005B10
_0800366C: .4byte 0x03005D20
_08003670: .4byte 0x02024E1C

	thumb_func_start FadeBgmOut_2
FadeBgmOut_2: @ 0x08003674
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, [r7]
	cmp r0, #0
	bge _08003686
	movs r0, #6
	str r0, [r7]
_08003686:
	ldr r0, _080036FC @ =0x03000038
	ldr r1, [r0]
	cmp r1, #0
	beq _0800369E
	ldr r0, _080036FC @ =0x03000038
	ldr r1, [r0]
	adds r0, r1, #0
	bl Proc_Break
	ldr r0, _080036FC @ =0x03000038
	movs r1, #0
	str r1, [r0]
_0800369E:
	ldr r0, _08003700 @ =0x0300003C
	ldr r1, [r0]
	cmp r1, #0
	beq _080036B6
	ldr r0, _08003700 @ =0x0300003C
	ldr r1, [r0]
	adds r0, r1, #0
	bl Proc_Break
	ldr r0, _08003700 @ =0x0300003C
	movs r1, #0
	str r1, [r0]
_080036B6:
	ldr r0, _08003704 @ =0x03005B10
	ldr r2, [r7]
	adds r1, r2, #0
	lsls r2, r1, #0x10
	lsrs r1, r2, #0x10
	bl m4aMPlayFadeOut
	ldr r0, _08003708 @ =0x03005D20
	ldr r2, [r7]
	adds r1, r2, #0
	lsls r2, r1, #0x10
	lsrs r1, r2, #0x10
	bl sub_080BE73C
	ldr r0, _0800370C @ =0x02024E1C
	ldrb r1, [r0, #6]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0, #6]
	ldr r0, _0800370C @ =0x02024E1C
	ldrb r1, [r0, #7]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #1
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0, #7]
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_080036FC: .4byte 0x03000038
_08003700: .4byte 0x0300003C
_08003704: .4byte 0x03005B10
_08003708: .4byte 0x03005D20
_0800370C: .4byte 0x02024E1C

	thumb_func_start sub_08003710
sub_08003710: @ 0x08003710
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, [r7]
	cmp r0, #0
	bne _08003722
	movs r0, #6
	str r0, [r7]
_08003722:
	ldr r0, _0800378C @ =0x03005D60
	ldr r2, [r7]
	adds r1, r2, #0
	lsls r2, r1, #0x10
	lsrs r1, r2, #0x10
	bl m4aMPlayFadeOut
	ldr r0, _08003790 @ =0x03005E30
	ldr r2, [r7]
	adds r1, r2, #0
	lsls r2, r1, #0x10
	lsrs r1, r2, #0x10
	bl m4aMPlayFadeOut
	ldr r0, _08003794 @ =0x03005DA0
	ldr r2, [r7]
	adds r1, r2, #0
	lsls r2, r1, #0x10
	lsrs r1, r2, #0x10
	bl m4aMPlayFadeOut
	ldr r0, _08003798 @ =0x03005A90
	ldr r2, [r7]
	adds r1, r2, #0
	lsls r2, r1, #0x10
	lsrs r1, r2, #0x10
	bl m4aMPlayFadeOut
	ldr r0, _0800379C @ =0x03005AD0
	ldr r2, [r7]
	adds r1, r2, #0
	lsls r2, r1, #0x10
	lsrs r1, r2, #0x10
	bl m4aMPlayFadeOut
	ldr r0, _080037A0 @ =0x03005CE0
	ldr r2, [r7]
	adds r1, r2, #0
	lsls r2, r1, #0x10
	lsrs r1, r2, #0x10
	bl m4aMPlayFadeOut
	ldr r0, _080037A4 @ =0x03005DF0
	ldr r2, [r7]
	adds r1, r2, #0
	lsls r2, r1, #0x10
	lsrs r1, r2, #0x10
	bl m4aMPlayFadeOut
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800378C: .4byte 0x03005D60
_08003790: .4byte 0x03005E30
_08003794: .4byte 0x03005DA0
_08003798: .4byte 0x03005A90
_0800379C: .4byte 0x03005AD0
_080037A0: .4byte 0x03005CE0
_080037A4: .4byte 0x03005DF0

	thumb_func_start StartBgmCore
StartBgmCore: @ 0x080037A8
	push {r7, lr}
	sub sp, #8
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	ldr r0, _08003808 @ =0x02024E1C
	ldrb r1, [r0, #6]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #1
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0, #6]
	ldr r0, _08003808 @ =0x02024E1C
	ldrb r1, [r0, #7]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0, #7]
	ldr r0, _08003808 @ =0x02024E1C
	ldr r2, [r7]
	adds r1, r2, #0
	ldrh r2, [r0, #4]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0, #4]
	ldr r1, [r7, #4]
	ldr r0, [r7]
	bl PlaySongCore
	ldr r1, _0800380C @ =0x03005B10
	adds r0, r1, #0
	bl m4aMPlayImmInit
	ldr r1, _08003810 @ =0x03005D20
	adds r0, r1, #0
	bl m4aMPlayImmInit
	add sp, #8
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08003808: .4byte 0x02024E1C
_0800380C: .4byte 0x03005B10
_08003810: .4byte 0x03005D20

	thumb_func_start StartOrChangeBgm
StartOrChangeBgm: @ 0x08003814
	push {r7, lr}
	sub sp, #0xc
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
	ldr r0, _08003838 @ =0x02024E1C
	movs r1, #6
	ldrsb r1, [r0, r1]
	cmp r1, #0
	beq _0800383C
	bl GetCurrentBgmSong
	ldr r1, [r7]
	cmp r0, r1
	bne _0800383C
	b _08003888
	.align 2, 0
_08003838: .4byte 0x02024E1C
_0800383C:
	ldr r1, _08003850 @ =0x0202BBF8
	adds r0, r1, #0
	adds r1, #0x41
	ldrb r0, [r1]
	lsls r1, r0, #0x1f
	lsrs r0, r1, #0x1f
	cmp r0, #0
	beq _08003854
	b _08003888
	.align 2, 0
_08003850: .4byte 0x0202BBF8
_08003854:
	bl sub_0800421C
	ldr r0, _0800387C @ =0x02024E1C
	movs r1, #6
	ldrsb r1, [r0, r1]
	cmp r1, #0
	beq _08003880
	ldr r1, [r7, #4]
	adds r0, r1, #0
	bl FadeBgmOut
	ldr r0, [r7, #4]
	adds r2, r0, #0
	lsls r1, r2, #4
	ldr r2, [r7, #8]
	ldr r0, [r7]
	bl PlaySongDelayed
	b _08003888
	.align 2, 0
_0800387C: .4byte 0x02024E1C
_08003880:
	ldr r1, [r7, #8]
	ldr r0, [r7]
	bl StartBgmCore
_08003888:
	add sp, #0xc
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start StartBgm
StartBgm: @ 0x08003890
	push {r7, lr}
	sub sp, #8
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	ldr r2, [r7, #4]
	ldr r0, [r7]
	movs r1, #3
	bl StartOrChangeBgm
	add sp, #8
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start StartBgmExt
StartBgmExt: @ 0x080038AC
	push {r7, lr}
	sub sp, #0xc
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
	ldr r1, [r7, #4]
	ldr r2, [r7, #8]
	ldr r0, [r7]
	bl StartOrChangeBgm
	add sp, #0xc
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_080038CC
sub_080038CC: @ 0x080038CC
	push {r4, r7, lr}
	sub sp, #0xc
	add r7, sp, #4
	str r0, [r7]
	movs r2, #0x80
	lsls r2, r2, #1
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x4c
	movs r0, #0
	ldrsh r3, [r1, r0]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x4e
	movs r4, #0
	ldrsh r0, [r1, r4]
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	bl sub_08012FE8
	str r0, [r7, #4]
	ldr r0, _0800396C @ =0x03005B10
	ldr r1, _08003970 @ =0x0000FFFF
	ldr r3, [r7, #4]
	adds r2, r3, #0
	lsls r3, r2, #0x10
	lsrs r2, r3, #0x10
	bl m4aMPlayVolumeControl
	ldr r0, _08003974 @ =0x03005D20
	ldr r1, _08003970 @ =0x0000FFFF
	ldr r3, [r7, #4]
	adds r2, r3, #0
	lsls r3, r2, #0x10
	lsrs r2, r3, #0x10
	bl m4aMPlayVolumeControl
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x4c
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x4c
	ldrh r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x4c
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x4c
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x4e
	movs r1, #0
	ldrsh r0, [r0, r1]
	movs r3, #0
	ldrsh r1, [r2, r3]
	cmp r0, r1
	blt _08003962
	ldr r0, [r7]
	bl Proc_Break
	ldr r0, _08003978 @ =0x03000038
	movs r1, #0
	str r1, [r0]
_08003962:
	add sp, #0xc
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800396C: .4byte 0x03005B10
_08003970: .4byte 0x0000FFFF
_08003974: .4byte 0x03005D20
_08003978: .4byte 0x03000038

	thumb_func_start StartBgmFadeIn
StartBgmFadeIn: @ 0x0800397C
	push {r7, lr}
	sub sp, #0x10
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
	ldr r1, _0800399C @ =0x0202BBF8
	adds r0, r1, #0
	adds r1, #0x41
	ldrb r0, [r1]
	lsls r1, r0, #0x1f
	lsrs r0, r1, #0x1f
	cmp r0, #0
	beq _080039A0
	b _08003A4E
	.align 2, 0
_0800399C: .4byte 0x0202BBF8
_080039A0:
	ldr r0, _08003A58 @ =0x02024E1C
	ldrb r1, [r0, #6]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #1
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0, #6]
	ldr r0, _08003A58 @ =0x02024E1C
	ldrb r1, [r0, #7]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0, #7]
	ldr r0, _08003A58 @ =0x02024E1C
	ldr r2, [r7]
	adds r1, r2, #0
	ldrh r2, [r0, #4]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0, #4]
	ldr r1, _08003A5C @ =0x08B85824
	adds r0, r1, #0
	movs r1, #3
	bl SpawnProc
	str r0, [r7, #0xc]
	ldr r1, _08003A60 @ =0x03005B10
	adds r0, r1, #0
	bl m4aMPlayStop
	ldr r1, _08003A64 @ =0x03005D20
	adds r0, r1, #0
	bl m4aMPlayStop
	ldr r1, [r7, #8]
	ldr r0, [r7]
	bl PlaySongCore
	ldr r1, _08003A60 @ =0x03005B10
	adds r0, r1, #0
	bl m4aMPlayImmInit
	ldr r1, _08003A64 @ =0x03005D20
	adds r0, r1, #0
	bl m4aMPlayImmInit
	ldr r0, _08003A60 @ =0x03005B10
	ldr r1, _08003A68 @ =0x0000FFFF
	movs r2, #0
	bl m4aMPlayVolumeControl
	ldr r0, _08003A64 @ =0x03005D20
	ldr r1, _08003A68 @ =0x0000FFFF
	movs r2, #0
	bl m4aMPlayVolumeControl
	ldr r0, [r7, #0xc]
	adds r1, r0, #0
	adds r0, #0x4c
	ldrh r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, [r7, #0xc]
	ldr r1, [r7, #4]
	adds r2, r1, #0
	lsls r1, r2, #4
	adds r2, r0, #0
	adds r0, #0x4e
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
	ldr r0, _08003A6C @ =0x03000038
	ldr r1, [r7, #0xc]
	str r1, [r0]
_08003A4E:
	add sp, #0x10
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08003A58: .4byte 0x02024E1C
_08003A5C: .4byte 0x08B85824
_08003A60: .4byte 0x03005B10
_08003A64: .4byte 0x03005D20
_08003A68: .4byte 0x0000FFFF
_08003A6C: .4byte 0x03000038

	thumb_func_start OverrideBgm
OverrideBgm: @ 0x08003A70
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r1, _08003A8C @ =0x0202BBF8
	adds r0, r1, #0
	adds r1, #0x41
	ldrb r0, [r1]
	lsls r1, r0, #0x1f
	lsrs r0, r1, #0x1f
	cmp r0, #0
	beq _08003A90
	b _08003AE2
	.align 2, 0
_08003A8C: .4byte 0x0202BBF8
_08003A90:
	ldr r0, _08003AEC @ =0x02024E1C
	ldr r1, _08003AEC @ =0x02024E1C
	ldrh r2, [r0, #2]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	ldrh r1, [r1, #4]
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0, #2]
	ldr r0, _08003AEC @ =0x02024E1C
	movs r1, #7
	ldrsb r1, [r0, r1]
	cmp r1, #0
	bne _08003ABA
	ldr r1, _08003AF0 @ =0x03005D20
	adds r0, r1, #0
	movs r1, #3
	bl sub_080BE73C
_08003ABA:
	ldr r0, _08003AEC @ =0x02024E1C
	ldrb r1, [r0, #6]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0, #6]
	ldr r0, _08003AEC @ =0x02024E1C
	ldrb r1, [r0, #7]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0, #7]
	ldr r0, [r7]
	cmp r0, #0
	beq _08003AE2
	ldr r2, _08003AF4 @ =0x03005B10
	ldr r0, [r7]
	movs r1, #0x20
	bl PlaySongDelayed
_08003AE2:
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08003AEC: .4byte 0x02024E1C
_08003AF0: .4byte 0x03005D20
_08003AF4: .4byte 0x03005B10

	thumb_func_start sub_08003AF8
sub_08003AF8: @ 0x08003AF8
	push {r7, lr}
	mov r7, sp
	ldr r1, _08003B10 @ =0x0202BBF8
	adds r0, r1, #0
	adds r1, #0x41
	ldrb r0, [r1]
	lsls r1, r0, #0x1f
	lsrs r0, r1, #0x1f
	cmp r0, #0
	beq _08003B14
	b _08003B7A
	.align 2, 0
_08003B10: .4byte 0x0202BBF8
_08003B14:
	ldr r0, _08003B20 @ =0x02024E1C
	ldrh r1, [r0, #2]
	cmp r1, #0
	bne _08003B24
	b _08003B7A
	.align 2, 0
_08003B20: .4byte 0x02024E1C
_08003B24:
	ldr r1, _08003B80 @ =0x03005B10
	adds r0, r1, #0
	movs r1, #3
	bl m4aMPlayFadeOut
	ldr r1, _08003B84 @ =0x03005D20
	adds r0, r1, #0
	movs r1, #6
	bl m4aMPlayFadeIn
	ldr r0, _08003B88 @ =0x02024E1C
	ldrb r1, [r0, #6]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #1
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0, #6]
	ldr r0, _08003B88 @ =0x02024E1C
	ldrb r1, [r0, #7]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0, #7]
	ldr r0, _08003B88 @ =0x02024E1C
	ldr r1, _08003B88 @ =0x02024E1C
	ldrh r2, [r0, #4]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	ldrh r1, [r1, #2]
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0, #4]
	ldr r0, _08003B88 @ =0x02024E1C
	ldrh r1, [r0, #2]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0, #2]
_08003B7A:
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08003B80: .4byte 0x03005B10
_08003B84: .4byte 0x03005D20
_08003B88: .4byte 0x02024E1C

	thumb_func_start RestoreBgm
RestoreBgm: @ 0x08003B8C
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	adds r1, r7, #0
	strh r0, [r1]
	ldr r1, _08003BA8 @ =0x0202BBF8
	adds r0, r1, #0
	adds r1, #0x41
	ldrb r0, [r1]
	lsls r1, r0, #0x1f
	lsrs r0, r1, #0x1f
	cmp r0, #0
	beq _08003BAC
	b _08003C14
	.align 2, 0
_08003BA8: .4byte 0x0202BBF8
_08003BAC:
	ldr r0, _08003BB8 @ =0x02024E1C
	ldrh r1, [r0, #2]
	cmp r1, #0
	bne _08003BBC
	b _08003C14
	.align 2, 0
_08003BB8: .4byte 0x02024E1C
_08003BBC:
	ldr r1, _08003C1C @ =0x03005B10
	adds r0, r1, #0
	movs r1, #3
	bl m4aMPlayFadeOut
	ldr r0, _08003C20 @ =0x03005D20
	adds r1, r7, #0
	ldrh r2, [r1]
	adds r1, r2, #0
	bl m4aMPlayFadeIn
	ldr r0, _08003C24 @ =0x02024E1C
	ldrb r1, [r0, #6]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #1
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0, #6]
	ldr r0, _08003C24 @ =0x02024E1C
	ldrb r1, [r0, #7]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0, #7]
	ldr r0, _08003C24 @ =0x02024E1C
	ldr r1, _08003C24 @ =0x02024E1C
	ldrh r2, [r0, #4]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	ldrh r1, [r1, #2]
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0, #4]
	ldr r0, _08003C24 @ =0x02024E1C
	ldrh r1, [r0, #2]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0, #2]
_08003C14:
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08003C1C: .4byte 0x03005B10
_08003C20: .4byte 0x03005D20
_08003C24: .4byte 0x02024E1C

	thumb_func_start sub_08003C28
sub_08003C28: @ 0x08003C28
	push {r7, lr}
	mov r7, sp
	ldr r1, _08003C40 @ =0x0202BBF8
	adds r0, r1, #0
	adds r1, #0x41
	ldrb r0, [r1]
	lsls r1, r0, #0x1f
	lsrs r0, r1, #0x1f
	cmp r0, #0
	beq _08003C44
	b _08003C66
	.align 2, 0
_08003C40: .4byte 0x0202BBF8
_08003C44:
	ldr r0, _08003C6C @ =0x02024E1C
	ldr r1, _08003C6C @ =0x02024E1C
	ldrh r2, [r0, #4]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	ldrh r1, [r1, #2]
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0, #4]
	ldr r0, _08003C6C @ =0x02024E1C
	ldrh r1, [r0, #2]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0, #2]
_08003C66:
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08003C6C: .4byte 0x02024E1C

	thumb_func_start StartBgmVolumeChange
StartBgmVolumeChange: @ 0x08003C70
	push {r7, lr}
	sub sp, #0x14
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
	str r3, [r7, #0xc]
	ldr r0, [r7, #0xc]
	cmp r0, #0
	beq _08003C94
	ldr r0, _08003C90 @ =0x08B8583C
	ldr r1, [r7, #0xc]
	bl SpawnProcLocking
	str r0, [r7, #0x10]
	b _08003CA0
	.align 2, 0
_08003C90: .4byte 0x08B8583C
_08003C94:
	ldr r1, _08003D18 @ =0x08B8583C
	adds r0, r1, #0
	movs r1, #3
	bl SpawnProc
	str r0, [r7, #0x10]
_08003CA0:
	ldr r1, [r7, #0x10]
	ldr r2, [r7]
	adds r0, r2, #0
	adds r2, r1, #0
	adds r1, #0x64
	ldrh r2, [r1]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r0, r3
	adds r2, r0, #0
	strh r2, [r1]
	ldr r1, [r7, #0x10]
	ldr r2, [r7, #4]
	adds r0, r2, #0
	adds r2, r1, #0
	adds r1, #0x66
	ldrh r2, [r1]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r0, r3
	adds r2, r0, #0
	strh r2, [r1]
	ldr r0, [r7, #0x10]
	adds r1, r0, #0
	adds r0, #0x68
	ldrh r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0]
	ldr r1, [r7, #0x10]
	ldr r2, [r7, #8]
	adds r0, r2, #0
	adds r2, r1, #0
	adds r1, #0x6a
	ldrh r2, [r1]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r0, r3
	adds r2, r0, #0
	strh r2, [r1]
	ldr r0, [r7]
	cmp r0, #0
	bne _08003D02
	movs r0, #1
	str r0, [r7]
_08003D02:
	ldr r0, [r7]
	bl SetBgmVolume
	ldr r0, _08003D1C @ =0x0300003C
	ldr r1, [r7, #0x10]
	str r1, [r0]
	add sp, #0x14
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08003D18: .4byte 0x08B8583C
_08003D1C: .4byte 0x0300003C

	thumb_func_start sub_08003D20
sub_08003D20: @ 0x08003D20
	push {r4, r5, r7, lr}
	sub sp, #0xc
	add r7, sp, #4
	str r0, [r7]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r2, r1, #0
	adds r2, #0x64
	movs r0, #0
	ldrsh r1, [r2, r0]
	ldr r2, [r7]
	adds r0, r2, #0
	adds r3, r2, #0
	adds r3, #0x66
	movs r5, #0
	ldrsh r2, [r3, r5]
	ldr r0, [r7]
	adds r3, r0, #0
	adds r0, #0x68
	ldrh r3, [r0]
	adds r4, r3, #1
	adds r5, r4, #0
	strh r5, [r0]
	lsls r0, r3, #0x10
	asrs r3, r0, #0x10
	ldr r4, [r7]
	adds r0, r4, #0
	adds r4, #0x6a
	movs r5, #0
	ldrsh r0, [r4, r5]
	str r0, [sp]
	movs r0, #4
	bl sub_08012FE8
	str r0, [r7, #4]
	ldr r1, [r7, #4]
	adds r0, r1, #0
	bl SetBgmVolume
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x68
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x6a
	movs r1, #0
	ldrsh r0, [r0, r1]
	movs r3, #0
	ldrsh r1, [r2, r3]
	cmp r0, r1
	blt _08003DFC
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x66
	movs r5, #0
	ldrsh r0, [r1, r5]
	cmp r0, #0
	bne _08003DDC
	bl GetCurrentBgmSong
	adds r1, r0, #0
	lsls r0, r1, #0x10
	lsrs r1, r0, #0x10
	adds r0, r1, #0
	bl sub_080BE660
	ldr r0, _08003DD8 @ =0x02024E1C
	ldrb r1, [r0, #6]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0, #6]
	ldr r0, _08003DD8 @ =0x02024E1C
	ldrb r1, [r0, #6]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0, #6]
	ldr r0, _08003DD8 @ =0x02024E1C
	ldrh r1, [r0, #2]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0, #2]
	ldr r0, _08003DD8 @ =0x02024E1C
	ldrh r1, [r0, #4]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0, #4]
	b _08003DF0
	.align 2, 0
_08003DD8: .4byte 0x02024E1C
_08003DDC:
	ldr r0, _08003E04 @ =0x02024E1C
	ldrb r1, [r0, #6]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #1
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0, #6]
_08003DF0:
	ldr r0, [r7]
	bl Proc_Break
	ldr r0, _08003E08 @ =0x0300003C
	movs r1, #0
	str r1, [r0]
_08003DFC:
	add sp, #0xc
	pop {r4, r5, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08003E04: .4byte 0x02024E1C
_08003E08: .4byte 0x0300003C

	thumb_func_start sub_08003E0C
sub_08003E0C: @ 0x08003E0C
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x4c
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x4c
	ldrh r3, [r2]
	subs r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x4c
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x4c
	movs r2, #0
	ldrsh r0, [r1, r2]
	cmp r0, #0
	blt _08003E4A
	b _08003E92
_08003E4A:
	ldr r0, _08003E9C @ =0x02024E1C
	ldrb r1, [r0, #6]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #1
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0, #6]
	ldr r0, _08003E9C @ =0x02024E1C
	ldr r1, [r7]
	adds r2, r1, #0
	adds r1, #0x4a
	ldrh r2, [r0, #4]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	ldrh r1, [r1]
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0, #4]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x4a
	movs r2, #0
	ldrsh r0, [r1, r2]
	ldr r1, [r7]
	ldr r2, [r1, #0x54]
	adds r1, r2, #0
	bl PlaySongCore
	ldr r0, [r7]
	bl Proc_End
_08003E92:
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08003E9C: .4byte 0x02024E1C

	thumb_func_start PlaySongDelayed
PlaySongDelayed: @ 0x08003EA0
	push {r7, lr}
	sub sp, #0x10
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
	ldr r1, _08003EC0 @ =0x0202BBF8
	adds r0, r1, #0
	adds r1, #0x41
	ldrb r0, [r1]
	lsls r1, r0, #0x1f
	lsrs r0, r1, #0x1f
	cmp r0, #0
	beq _08003EC4
	b _08003F06
	.align 2, 0
_08003EC0: .4byte 0x0202BBF8
_08003EC4:
	ldr r1, _08003F10 @ =0x08B85854
	adds r0, r1, #0
	movs r1, #3
	bl SpawnProc
	str r0, [r7, #0xc]
	ldr r1, [r7, #0xc]
	ldr r2, [r7, #4]
	adds r0, r2, #0
	adds r2, r1, #0
	adds r1, #0x4c
	ldrh r2, [r1]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r0, r3
	adds r2, r0, #0
	strh r2, [r1]
	ldr r1, [r7, #0xc]
	ldr r2, [r7]
	adds r0, r2, #0
	adds r2, r1, #0
	adds r1, #0x4a
	ldrh r2, [r1]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r0, r3
	adds r2, r0, #0
	strh r2, [r1]
	ldr r0, [r7, #0xc]
	ldr r1, [r7, #8]
	str r1, [r0, #0x54]
_08003F06:
	add sp, #0x10
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08003F10: .4byte 0x08B85854

	thumb_func_start PlaySongCore
PlaySongCore: @ 0x08003F14
	push {r7, lr}
	sub sp, #8
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	ldr r0, [r7]
	cmp r0, #0x7f
	bgt _08003F32
	ldr r0, [r7]
	bl sub_08003FC0
	movs r0, #0
	ldr r1, [r7]
	bl sub_0809F748
_08003F32:
	ldr r0, [r7, #4]
	cmp r0, #0
	beq _08003F54
	ldr r0, [r7, #4]
	ldr r1, _08003F50 @ =0x0869D6E0
	ldr r2, [r7]
	adds r3, r2, #0
	lsls r2, r3, #3
	adds r1, r1, r2
	ldr r2, [r1]
	adds r1, r2, #0
	bl sub_080BECC8
	b _08003F62
	.align 2, 0
_08003F50: .4byte 0x0869D6E0
_08003F54:
	ldr r1, [r7]
	adds r0, r1, #0
	lsls r2, r0, #0x10
	lsrs r1, r2, #0x10
	adds r0, r1, #0
	bl sub_080BE594
_08003F62:
	add sp, #8
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_08003F6C
sub_08003F6C: @ 0x08003F6C
	push {r7, lr}
	mov r7, sp
	movs r0, #7
	bl sub_08003F8C
	ldr r0, _08003F88 @ =0x02024E1C
	ldrb r1, [r0, #8]
	movs r2, #0xff
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0, #8]
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08003F88: .4byte 0x02024E1C

	thumb_func_start sub_08003F8C
sub_08003F8C: @ 0x08003F8C
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, _08003FBC @ =0x02024E1C
	ldr r2, [r7]
	adds r1, r2, #0
	ldrb r2, [r0, #8]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0, #8]
	ldr r0, [r7]
	lsls r1, r0, #8
	adds r0, r1, #0
	bl sub_080BEAAC
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08003FBC: .4byte 0x02024E1C

	thumb_func_start sub_08003FC0
sub_08003FC0: @ 0x08003FC0
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, [r7]
	cmp r0, #0x5a
	beq _08003FF0
	cmp r0, #0x5a
	bgt _08003FDC
	cmp r0, #0x2a
	bgt _08004008
	cmp r0, #0x29
	blt _08004008
	b _08003FF0
_08003FDC:
	cmp r0, #0x5f
	beq _08003FF0
	cmp r0, #0x5f
	bgt _08003FEA
	cmp r0, #0x5c
	beq _08003FF0
	b _08004008
_08003FEA:
	cmp r0, #0x74
	beq _08003FF0
	b _08004008
_08003FF0:
	ldr r0, _08004004 @ =0x02024E1C
	movs r1, #8
	ldrsb r1, [r0, r1]
	cmp r1, #8
	beq _08004000
	movs r0, #8
	bl sub_08003F8C
_08004000:
	b _08004020
	.align 2, 0
_08004004: .4byte 0x02024E1C
_08004008:
	ldr r0, _0800401C @ =0x02024E1C
	movs r1, #8
	ldrsb r1, [r0, r1]
	movs r0, #1
	cmn r1, r0
	beq _08004018
	bl sub_08003F6C
_08004018:
	b _08004020
	.align 2, 0
_0800401C: .4byte 0x02024E1C
_08004020:
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start sub_08004028
sub_08004028: @ 0x08004028
	push {r7, lr}
	mov r7, sp
	ldr r1, _0800403C @ =0x08B8583C
	adds r0, r1, #0
	bl Proc_Find
	cmp r0, #0
	beq _08004040
	movs r0, #1
	b _08004044
	.align 2, 0
_0800403C: .4byte 0x08B8583C
_08004040:
	movs r0, #0
	b _08004044
_08004044:
	pop {r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_0800404C
sub_0800404C: @ 0x0800404C
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	bl sub_080034F4
	lsls r1, r0, #0x18
	asrs r0, r1, #0x18
	cmp r0, #0
	beq _080040AE
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x64
	movs r2, #0
	ldrsh r0, [r1, r2]
	cmp r0, #0
	beq _080040AE
	ldr r0, [r7]
	ldr r1, [r0, #0x5c]
	movs r0, #1
	cmn r1, r0
	bne _08004098
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x64
	movs r3, #0
	ldrsh r0, [r1, r3]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x66
	movs r3, #0
	ldrsh r1, [r2, r3]
	ldr r3, [r7]
	ldr r2, [r3, #0x58]
	ldr r3, [r7]
	bl StartBgmVolumeChange
	b _080040AE
_08004098:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x64
	movs r2, #0
	ldrsh r0, [r1, r2]
	ldr r1, [r7]
	ldr r2, [r1, #0x58]
	movs r1, #0
	ldr r3, [r7]
	bl StartBgmVolumeChange
_080040AE:
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_080040B8
sub_080040B8: @ 0x080040B8
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, [r7]
	ldr r1, [r0, #0x5c]
	cmp r1, #0
	ble _080040E6
	ldr r0, [r7]
	ldr r1, [r0, #0x5c]
	adds r0, r1, #0
	movs r1, #0
	bl StartBgm
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x66
	movs r0, #0
	ldrsh r2, [r1, r0]
	adds r0, r2, #0
	bl SetBgmVolume
	b _080040EE
_080040E6:
	ldr r0, [r7]
	movs r1, #0
	bl Proc_Goto
_080040EE:
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_080040F8
sub_080040F8: @ 0x080040F8
	push {r7, lr}
	sub sp, #0x14
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
	str r3, [r7, #0xc]
	bl sub_080034F4
	lsls r1, r0, #0x18
	asrs r0, r1, #0x18
	cmp r0, #0
	beq _0800412C
	ldr r0, _08004128 @ =0x02024E1C
	ldrh r1, [r0, #4]
	ldr r0, [r7]
	cmp r0, r1
	bne _0800412C
	ldr r0, [r7, #4]
	ldr r1, [r7, #8]
	cmp r0, r1
	bne _0800412C
	b _080041B6
	.align 2, 0
_08004128: .4byte 0x02024E1C
_0800412C:
	ldr r0, [r7, #0x1c]
	cmp r0, #0
	beq _08004144
	ldr r1, _08004140 @ =0x08B85864
	adds r0, r1, #0
	ldr r1, [r7, #0x1c]
	bl SpawnProcLocking
	str r0, [r7, #0x10]
	b _08004150
	.align 2, 0
_08004140: .4byte 0x08B85864
_08004144:
	ldr r1, _08004178 @ =0x08B85864
	adds r0, r1, #0
	movs r1, #3
	bl SpawnProc
	str r0, [r7, #0x10]
_08004150:
	ldr r0, [r7, #0x10]
	ldr r1, [r7, #0xc]
	str r1, [r0, #0x58]
	bl sub_080034F4
	lsls r1, r0, #0x18
	asrs r0, r1, #0x18
	cmp r0, #0
	beq _08004180
	ldr r0, _0800417C @ =0x02024E1C
	ldrh r1, [r0, #4]
	ldr r0, [r7]
	cmp r0, r1
	bne _08004180
	ldr r0, [r7, #0x10]
	movs r1, #1
	rsbs r1, r1, #0
	str r1, [r0, #0x5c]
	b _08004186
	.align 2, 0
_08004178: .4byte 0x08B85864
_0800417C: .4byte 0x02024E1C
_08004180:
	ldr r0, [r7, #0x10]
	ldr r1, [r7]
	str r1, [r0, #0x5c]
_08004186:
	ldr r1, [r7, #0x10]
	ldr r2, [r7, #4]
	adds r0, r2, #0
	adds r2, r1, #0
	adds r1, #0x64
	ldrh r2, [r1]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r0, r3
	adds r2, r0, #0
	strh r2, [r1]
	ldr r1, [r7, #0x10]
	ldr r2, [r7, #8]
	adds r0, r2, #0
	adds r2, r1, #0
	adds r1, #0x66
	ldrh r2, [r1]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r0, r3
	adds r2, r0, #0
	strh r2, [r1]
_080041B6:
	add sp, #0x14
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_080041C0
sub_080041C0: @ 0x080041C0
	push {r7, lr}
	mov r7, sp
	ldr r1, _080041D4 @ =0x08B85864
	adds r0, r1, #0
	bl Proc_Find
	cmp r0, #0
	beq _080041D8
	movs r0, #1
	b _080041DC
	.align 2, 0
_080041D4: .4byte 0x08B85864
_080041D8:
	movs r0, #0
	b _080041DC
_080041DC:
	pop {r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_080041E4
sub_080041E4: @ 0x080041E4
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, _08004218 @ =0x02024E1C
	ldrh r1, [r0, #4]
	ldr r0, [r7]
	cmp r0, r1
	beq _08004210
	bl sub_080034F4
	lsls r1, r0, #0x18
	asrs r0, r1, #0x18
	cmp r0, #0
	beq _08004208
	movs r0, #0
	bl SetBgmVolume
_08004208:
	ldr r0, [r7]
	movs r1, #0
	bl StartBgmCore
_08004210:
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08004218: .4byte 0x02024E1C

	thumb_func_start sub_0800421C
sub_0800421C: @ 0x0800421C
	push {r7, lr}
	mov r7, sp
	ldr r1, _08004230 @ =0x08B85854
	adds r0, r1, #0
	bl Proc_EndEach
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08004230: .4byte 0x08B85854

	thumb_func_start sub_08004234
sub_08004234: @ 0x08004234
	push {r7, lr}
	mov r7, sp
	bl sub_0800421C
	ldr r1, _08004270 @ =0x03005B10
	adds r0, r1, #0
	movs r1, #1
	bl m4aMPlayFadeOut
	ldr r1, _08004274 @ =0x03005D20
	adds r0, r1, #0
	movs r1, #1
	bl m4aMPlayFadeOut
	ldr r0, _08004278 @ =0x02024E1C
	ldrh r1, [r0, #2]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0, #2]
	ldr r0, _08004278 @ =0x02024E1C
	ldrh r1, [r0, #4]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0, #4]
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08004270: .4byte 0x03005B10
_08004274: .4byte 0x03005D20
_08004278: .4byte 0x02024E1C

	thumb_func_start sub_0800427C
sub_0800427C: @ 0x0800427C
	push {r4, r7, lr}
	sub sp, #4
	mov r7, sp
	ldr r0, _080042FC @ =0x080009FC
	ldr r1, _08004300 @ =_08000228
	subs r0, r0, r1
	str r0, [r7]
	ldr r0, _08004300 @ =_08000228
	ldr r1, _08004304 @ =0x03002F40
	ldr r2, [r7]
	asrs r3, r2, #0x1f
	lsrs r4, r3, #0x1f
	adds r3, r2, r4
	asrs r2, r3, #1
	lsls r3, r2, #0xb
	lsrs r2, r3, #0xb
	bl CpuSet
	ldr r0, _08004308 @ =0x03002F30
	ldr r1, _0800430C @ =DrawGlyph
	ldr r2, _08004300 @ =_08000228
	subs r1, r1, r2
	ldr r2, _08004304 @ =0x03002F40
	adds r1, r2, r1
	str r1, [r0]
	ldr r0, _08004310 @ =0x03003940
	ldr r1, _08004314 @ =DecodeString
	ldr r2, _08004300 @ =_08000228
	subs r1, r1, r2
	ldr r2, _08004304 @ =0x03002F40
	adds r1, r2, r1
	str r1, [r0]
	ldr r0, _08004318 @ =0x03002920
	ldr r1, _0800431C @ =PutOamHi
	ldr r2, _08004300 @ =_08000228
	subs r1, r1, r2
	ldr r2, _08004304 @ =0x03002F40
	adds r1, r2, r1
	str r1, [r0]
	ldr r0, _08004320 @ =0x03003944
	ldr r1, _08004324 @ =PutOamLo
	ldr r2, _08004300 @ =_08000228
	subs r1, r1, r2
	ldr r2, _08004304 @ =0x03002F40
	adds r1, r2, r1
	str r1, [r0]
	ldr r0, _08004328 @ =0x03004150
	ldr r1, _0800432C @ =MapFloodCoreStep
	ldr r2, _08004300 @ =_08000228
	subs r1, r1, r2
	ldr r2, _08004304 @ =0x03002F40
	adds r1, r2, r1
	str r1, [r0]
	ldr r0, _08004330 @ =0x03002918
	ldr r1, _08004334 @ =MapFloodCore
	ldr r2, _08004300 @ =_08000228
	subs r1, r1, r2
	ldr r2, _08004304 @ =0x03002F40
	adds r1, r2, r1
	str r1, [r0]
	add sp, #4
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080042FC: .4byte 0x080009FC
_08004300: .4byte _08000228
_08004304: .4byte 0x03002F40
_08004308: .4byte 0x03002F30
_0800430C: .4byte DrawGlyph
_08004310: .4byte 0x03003940
_08004314: .4byte DecodeString
_08004318: .4byte 0x03002920
_0800431C: .4byte PutOamHi
_08004320: .4byte 0x03003944
_08004324: .4byte PutOamLo
_08004328: .4byte 0x03004150
_0800432C: .4byte MapFloodCoreStep
_08004330: .4byte 0x03002918
_08004334: .4byte MapFloodCore

	thumb_func_start DrawGlyphRam
DrawGlyphRam: @ 0x08004338
	push {r4, r7, lr}
	sub sp, #0x10
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
	str r3, [r7, #0xc]
	ldr r0, _08004360 @ =0x03002F30
	ldr r1, [r7, #4]
	ldr r2, [r7, #8]
	ldr r3, [r7, #0xc]
	ldr r4, [r0]
	ldr r0, [r7]
	bl _call_via_r4
	add sp, #0x10
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08004360: .4byte 0x03002F30

	thumb_func_start DecodeStringRam
DecodeStringRam: @ 0x08004364
	push {r7, lr}
	sub sp, #8
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	ldr r0, _08004384 @ =0x03003940
	ldr r1, [r7, #4]
	ldr r2, [r0]
	ldr r0, [r7]
	bl _call_via_r2
	add sp, #8
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08004384: .4byte 0x03003940

	thumb_func_start PutOamHiRam
PutOamHiRam: @ 0x08004388
	push {r4, r7, lr}
	sub sp, #0x10
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
	str r3, [r7, #0xc]
	ldr r0, _080043B0 @ =0x03002920
	ldr r1, [r7, #4]
	ldr r2, [r7, #8]
	ldr r3, [r7, #0xc]
	ldr r4, [r0]
	ldr r0, [r7]
	bl _call_via_r4
	add sp, #0x10
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080043B0: .4byte 0x03002920

	thumb_func_start PutOamLoRam
PutOamLoRam: @ 0x080043B4
	push {r4, r7, lr}
	sub sp, #0x10
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
	str r3, [r7, #0xc]
	ldr r0, _080043DC @ =0x03003944
	ldr r1, [r7, #4]
	ldr r2, [r7, #8]
	ldr r3, [r7, #0xc]
	ldr r4, [r0]
	ldr r0, [r7]
	bl _call_via_r4
	add sp, #0x10
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080043DC: .4byte 0x03003944

	thumb_func_start sub_080043E0
sub_080043E0: @ 0x080043E0
	push {r7, lr}
	sub sp, #0xc
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
	ldr r0, _08004404 @ =0x03004150
	ldr r1, [r7, #4]
	ldr r2, [r7, #8]
	ldr r3, [r0]
	ldr r0, [r7]
	bl _call_via_r3
	add sp, #0xc
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08004404: .4byte 0x03004150

	thumb_func_start MapFloodCoreRam
MapFloodCoreRam: @ 0x08004408
	push {r4, r7, lr}
	mov r7, sp
	ldr r0, _0800441C @ =0x03002918
	ldr r4, [r0]
	bl _call_via_r4
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800441C: .4byte 0x03002918

	thumb_func_start sub_08004420
sub_08004420: @ 0x08004420
	push {r4, r5, r6, r7, lr}
	movs r4, #0
	ldr r7, _08004484 @ =0x02024E28
	ldr r5, _08004488 @ =0x02026928
	ldr r0, _0800448C @ =0x02026A2C
	mov ip, r0
	movs r2, #0
	adds r6, r5, #0
	movs r3, #0
_08004432:
	adds r1, r3, r7
	str r2, [r1]
	str r2, [r1, #4]
	str r2, [r1, #8]
	str r2, [r1, #0xc]
	str r2, [r1, #0x10]
	str r2, [r1, #0x14]
	str r2, [r1, #0x18]
	str r2, [r1, #0x1c]
	str r2, [r1, #0x20]
	strh r2, [r1, #0x24]
	adds r0, r1, #0
	adds r0, #0x26
	strb r2, [r0]
	adds r0, #1
	strb r2, [r0]
	adds r0, #1
	strb r2, [r0]
	stm r6!, {r1}
	adds r3, #0x6c
	adds r4, #1
	cmp r4, #0x3f
	ble _08004432
	movs r0, #0x80
	lsls r0, r0, #1
	adds r1, r5, r0
	movs r0, #0
	str r0, [r1]
	mov r0, ip
	str r5, [r0]
	ldr r1, _08004490 @ =0x02026A30
	movs r2, #0
	adds r0, r1, #0
	adds r0, #0x1c
_08004476:
	str r2, [r0]
	subs r0, #4
	cmp r0, r1
	bge _08004476
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08004484: .4byte 0x02024E28
_08004488: .4byte 0x02026928
_0800448C: .4byte 0x02026A2C
_08004490: .4byte 0x02026A30

	thumb_func_start SpawnProc
SpawnProc: @ 0x08004494
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r6, r1, #0
	bl sub_0800459C
	adds r5, r0, #0
	str r4, [r5]
	str r4, [r5, #4]
	movs r0, #0
	str r0, [r5, #8]
	str r0, [r5, #0xc]
	str r0, [r5, #0x14]
	str r0, [r5, #0x18]
	str r0, [r5, #0x1c]
	str r0, [r5, #0x20]
	movs r1, #0
	strh r0, [r5, #0x24]
	adds r0, r5, #0
	adds r0, #0x26
	strb r1, [r0]
	adds r0, #2
	strb r1, [r0]
	adds r1, r5, #0
	adds r1, #0x27
	movs r0, #8
	strb r0, [r1]
	cmp r6, #7
	bgt _080044D6
	adds r0, r5, #0
	adds r1, r6, #0
	bl sub_080045BC
	b _080044DE
_080044D6:
	adds r0, r5, #0
	adds r1, r6, #0
	bl sub_080045DC
_080044DE:
	adds r0, r5, #0
	bl sub_08004B84
	adds r1, r5, #0
	adds r1, #0x27
	movs r0, #0xf7
	ldrb r2, [r1]
	ands r0, r2
	strb r0, [r1]
	adds r0, r5, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	thumb_func_start SpawnProcLocking
SpawnProcLocking: @ 0x080044F8
	push {lr}
	bl SpawnProc
	adds r2, r0, #0
	ldr r0, [r2]
	cmp r0, #0
	beq _08004520
	adds r1, r2, #0
	adds r1, #0x27
	movs r0, #2
	ldrb r3, [r1]
	orrs r0, r3
	strb r0, [r1]
	ldr r0, [r2, #0x14]
	adds r0, #0x28
	ldrb r1, [r0]
	adds r1, #1
	strb r1, [r0]
	adds r0, r2, #0
	b _08004522
_08004520:
	movs r0, #0
_08004522:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_08004528
sub_08004528: @ 0x08004528
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x20]
	cmp r0, #0
	beq _08004536
	bl sub_08004528
_08004536:
	ldr r0, [r4, #0x18]
	cmp r0, #0
	beq _08004540
	bl sub_08004528
_08004540:
	adds r6, r4, #0
	adds r6, #0x27
	movs r5, #1
	ldrb r0, [r6]
	ands r5, r0
	cmp r5, #0
	bne _0800457E
	ldr r1, [r4, #8]
	cmp r1, #0
	beq _0800455A
	adds r0, r4, #0
	bl _call_via_r1
_0800455A:
	adds r0, r4, #0
	bl sub_080045AC
	str r5, [r4]
	str r5, [r4, #0xc]
	movs r0, #1
	ldrb r1, [r6]
	orrs r0, r1
	strb r0, [r6]
	movs r1, #2
	ands r0, r1
	cmp r0, #0
	beq _0800457E
	ldr r0, [r4, #0x14]
	adds r0, #0x28
	ldrb r1, [r0]
	subs r1, #1
	strb r1, [r0]
_0800457E:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start Proc_End
Proc_End: @ 0x08004584
	push {r4, lr}
	adds r4, r0, #0
	cmp r4, #0
	beq _08004596
	bl sub_080045F0
	adds r0, r4, #0
	bl sub_08004528
_08004596:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_0800459C
sub_0800459C: @ 0x0800459C
	ldr r1, _080045A8 @ =0x02026A2C
	ldr r2, [r1]
	ldm r2!, {r0}
	str r2, [r1]
	bx lr
	.align 2, 0
_080045A8: .4byte 0x02026A2C

	thumb_func_start sub_080045AC
sub_080045AC: @ 0x080045AC
	ldr r2, _080045B8 @ =0x02026A2C
	ldr r1, [r2]
	subs r1, #4
	str r1, [r2]
	str r0, [r1]
	bx lr
	.align 2, 0
_080045B8: .4byte 0x02026A2C

	thumb_func_start sub_080045BC
sub_080045BC: @ 0x080045BC
	adds r2, r0, #0
	adds r3, r1, #0
	lsls r1, r3, #2
	ldr r0, _080045D8 @ =0x02026A30
	adds r1, r1, r0
	ldr r0, [r1]
	cmp r0, #0
	beq _080045D0
	str r2, [r0, #0x1c]
	str r0, [r2, #0x20]
_080045D0:
	str r3, [r2, #0x14]
	str r2, [r1]
	bx lr
	.align 2, 0
_080045D8: .4byte 0x02026A30

	thumb_func_start sub_080045DC
sub_080045DC: @ 0x080045DC
	adds r2, r0, #0
	ldr r0, [r1, #0x18]
	cmp r0, #0
	beq _080045EA
	str r2, [r0, #0x1c]
	ldr r0, [r1, #0x18]
	str r0, [r2, #0x20]
_080045EA:
	str r2, [r1, #0x18]
	str r1, [r2, #0x14]
	bx lr

	thumb_func_start sub_080045F0
sub_080045F0: @ 0x080045F0
	adds r2, r0, #0
	ldr r1, [r2, #0x1c]
	cmp r1, #0
	beq _080045FC
	ldr r0, [r2, #0x20]
	str r0, [r1, #0x20]
_080045FC:
	ldr r1, [r2, #0x20]
	cmp r1, #0
	beq _08004606
	ldr r0, [r2, #0x1c]
	str r0, [r1, #0x1c]
_08004606:
	ldr r1, [r2, #0x14]
	cmp r1, #8
	ble _08004618
	ldr r0, [r1, #0x18]
	cmp r0, r2
	bne _08004628
	ldr r0, [r2, #0x20]
	str r0, [r1, #0x18]
	b _08004628
_08004618:
	lsls r0, r1, #2
	ldr r1, _08004630 @ =0x02026A30
	adds r1, r0, r1
	ldr r0, [r1]
	cmp r0, r2
	bne _08004628
	ldr r0, [r2, #0x20]
	str r0, [r1]
_08004628:
	movs r0, #0
	str r0, [r2, #0x1c]
	str r0, [r2, #0x20]
	bx lr
	.align 2, 0
_08004630: .4byte 0x02026A30

	thumb_func_start sub_08004634
sub_08004634: @ 0x08004634
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x20]
	cmp r0, #0
	beq _08004642
	bl sub_08004634
_08004642:
	adds r0, r4, #0
	adds r0, #0x28
	ldrb r0, [r0]
	cmp r0, #0
	bne _08004680
	adds r1, r4, #0
	adds r1, #0x27
	movs r0, #8
	ldrb r2, [r1]
	ands r0, r2
	adds r5, r1, #0
	cmp r0, #0
	bne _08004680
	ldr r0, [r4, #0xc]
	cmp r0, #0
	bne _0800466E
	adds r0, r4, #0
	bl sub_08004B84
	ldr r0, [r4, #0xc]
	cmp r0, #0
	beq _08004676
_0800466E:
	ldr r1, [r4, #0xc]
	adds r0, r4, #0
	bl _call_via_r1
_08004676:
	movs r0, #1
	ldrb r5, [r5]
	ands r0, r5
	cmp r0, #0
	bne _0800468A
_08004680:
	ldr r0, [r4, #0x18]
	cmp r0, #0
	beq _0800468A
	bl sub_08004634
_0800468A:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_08004690
sub_08004690: @ 0x08004690
	push {lr}
	cmp r0, #0
	beq _0800469A
	bl sub_08004634
_0800469A:
	pop {r0}
	bx r0
	.align 2, 0
