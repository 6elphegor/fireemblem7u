	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080349E4
sub_080349E4: @ 0x080349E4
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0xc
	mov r8, r0
	movs r5, #0
	ldr r0, _08034A70 @ =0x0202BBF8
	ldrb r2, [r0, #0xf]
	mov r1, sp
	ldr r0, _08034A74 @ =0x081D3658
	ldm r0!, {r3, r4, r6}
	stm r1!, {r3, r4, r6}
	movs r6, #0
	lsrs r0, r2, #6
	lsls r0, r0, #2
	mov r3, sp
	adds r1, r3, r0
	ldr r0, [r1]
	cmp r5, r0
	bge _08034A48
	adds r7, r1, #0
	adds r4, r2, #1
_08034A10:
	adds r0, r4, #0
	bl GetUnit
	adds r2, r0, #0
	ldr r0, [r2]
	cmp r0, #0
	beq _08034A3E
	adds r1, r2, #0
	adds r1, #0x30
	movs r0, #0xf
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #4
	bne _08034A3E
	ldr r0, [r2, #0xc]
	ldr r1, _08034A78 @ =0x00000427
	ands r0, r1
	cmp r0, #0
	bne _08034A3E
	ldr r0, _08034A7C @ =0x0203A8EC
	adds r0, r5, r0
	strb r4, [r0]
	adds r5, #1
_08034A3E:
	adds r4, #1
	adds r6, #1
	ldr r0, [r7]
	cmp r6, r0
	blt _08034A10
_08034A48:
	cmp r5, #0
	beq _08034A64
	ldr r0, _08034A7C @ =0x0203A8EC
	adds r2, r5, r0
	movs r1, #0
	strb r1, [r2]
	str r0, [r0, #0x74]
	ldr r1, _08034A80 @ =0x030047A0
	ldr r0, _08034A84 @ =AiDecideMain
	str r0, [r1]
	ldr r0, _08034A88 @ =0x08B96F44
	mov r1, r8
	bl Proc_StartBlocking
_08034A64:
	add sp, #0xc
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08034A70: .4byte 0x0202BBF8
_08034A74: .4byte 0x081D3658
_08034A78: .4byte 0x00000427
_08034A7C: .4byte 0x0203A8EC
_08034A80: .4byte 0x030047A0
_08034A84: .4byte AiDecideMain
_08034A88: .4byte 0x08B96F44
