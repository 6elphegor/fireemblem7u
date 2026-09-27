	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0803D584
sub_0803D584: @ 0x0803D584
	push {r4, lr}
	sub sp, #4
	ldr r1, _0803D5E0 @ =0x00002586
	mov r0, sp
	strh r1, [r0]
	ldr r3, _0803D5E4 @ =0x08B98AEC
	ldr r1, [r3]
	movs r2, #0
	movs r0, #0
	strh r0, [r1, #4]
	strb r2, [r1, #1]
	ldr r0, [r3]
	ldr r1, _0803D5E8 @ =0x00001B7C
	adds r0, r0, r1
	movs r1, #0x88
	strh r1, [r0]
	ldr r1, _0803D5EC @ =0x030013DA
	ldr r0, _0803D5F0 @ =0x030013D8
	ldrh r0, [r0]
	strh r0, [r1]
	adds r4, r3, #0
	ldr r3, _0803D5F4 @ =0x030013E0
	ldr r2, _0803D5F8 @ =0x030013E8
	movs r1, #3
_0803D5B4:
	ldrh r0, [r3]
	strh r0, [r2]
	adds r3, #2
	adds r2, #2
	subs r1, #1
	cmp r1, #0
	bge _0803D5B4
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
_0803D5E0: .4byte 0x00002586
_0803D5E4: .4byte 0x08B98AEC
_0803D5E8: .4byte 0x00001B7C
_0803D5EC: .4byte 0x030013DA
_0803D5F0: .4byte 0x030013D8
_0803D5F4: .4byte 0x030013E0
_0803D5F8: .4byte 0x030013E8
