	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0803D510
sub_0803D510: @ 0x0803D510
	push {lr}
	sub sp, #4
	ldr r1, _0803D564 @ =0x00007FFF
	mov r0, sp
	strh r1, [r0]
	ldr r1, _0803D568 @ =0x08B98AEC
	ldr r0, [r1]
	movs r2, #0
	strb r2, [r0, #1]
	ldr r0, [r1]
	ldr r1, _0803D56C @ =0x00001B7C
	adds r0, r0, r1
	strh r2, [r0]
	mov r0, sp
	movs r1, #1
	bl SioSend16
	ldr r1, _0803D570 @ =0x030013DA
	ldr r0, _0803D574 @ =0x030013D8
	ldrh r0, [r0]
	strh r0, [r1]
	ldr r3, _0803D578 @ =0x030013E0
	ldr r2, _0803D57C @ =0x030013E8
	movs r1, #3
_0803D540:
	ldrh r0, [r3]
	strh r0, [r2]
	adds r3, #2
	adds r2, #2
	subs r1, #1
	cmp r1, #0
	bge _0803D540
	ldr r0, _0803D568 @ =0x08B98AEC
	ldr r2, [r0]
	ldr r0, _0803D580 @ =0x00001B7E
	adds r1, r2, r0
	movs r0, #0
	strh r0, [r1]
	movs r0, #3
	strb r0, [r2, #1]
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_0803D564: .4byte 0x00007FFF
_0803D568: .4byte 0x08B98AEC
_0803D56C: .4byte 0x00001B7C
_0803D570: .4byte 0x030013DA
_0803D574: .4byte 0x030013D8
_0803D578: .4byte 0x030013E0
_0803D57C: .4byte 0x030013E8
_0803D580: .4byte 0x00001B7E
