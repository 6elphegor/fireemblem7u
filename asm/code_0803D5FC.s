	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0803D5FC
sub_0803D5FC: @ 0x0803D5FC
	push {r4, lr}
	sub sp, #4
	ldr r1, _0803D658 @ =0x00002586
	mov r0, sp
	strh r1, [r0]
	ldr r3, _0803D65C @ =0x08B98AEC
	ldr r1, [r3]
	movs r2, #0
	movs r0, #0
	strh r0, [r1, #4]
	strb r2, [r1, #1]
	ldr r0, [r3]
	ldr r1, _0803D660 @ =0x00001B7C
	adds r0, r0, r1
	movs r1, #0x18
	strh r1, [r0]
	ldr r1, _0803D664 @ =0x030013DA
	ldr r0, _0803D668 @ =0x030013D8
	ldrh r0, [r0]
	strh r0, [r1]
	adds r4, r3, #0
	ldr r3, _0803D66C @ =0x030013E0
	ldr r2, _0803D670 @ =0x030013E8
	movs r1, #3
_0803D62C:
	ldrh r0, [r3]
	strh r0, [r2]
	adds r3, #2
	adds r2, #2
	subs r1, #1
	cmp r1, #0
	bge _0803D62C
	ldr r1, [r4]
	movs r0, #1
	strb r0, [r1, #1]
	ldr r1, [r4]
	movs r0, #6
	strh r0, [r1, #4]
	movs r1, #1
	rsbs r1, r1, #0
	mov r0, sp
	bl SioSend16
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0803D658: .4byte 0x00002586
_0803D65C: .4byte 0x08B98AEC
_0803D660: .4byte 0x00001B7C
_0803D664: .4byte 0x030013DA
_0803D668: .4byte 0x030013D8
_0803D66C: .4byte 0x030013E0
_0803D670: .4byte 0x030013E8
