	.include "macro.inc"

	.syntax unified

	thumb_func_start AiDecideMain
AiDecideMain: @ 0x08034EDC
	push {r4, r5, lr}
	ldr r2, _08034F34 @ =0x08B96F14
	ldr r0, _08034F38 @ =0x0203A8EC
	adds r1, r0, #0
	adds r1, #0x79
	ldrb r3, [r1]
	lsls r0, r3, #2
	adds r0, r0, r2
	ldr r0, [r0]
	cmp r0, #0
	beq _08034F2C
	ldr r0, _08034F3C @ =0x0203A97C
	ldrb r0, [r0, #0xa]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _08034F2C
	adds r5, r2, #0
	adds r4, r1, #0
_08034F02:
	ldrb r0, [r4]
	adds r1, r0, #1
	strb r1, [r4]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x16
	adds r0, r0, r5
	ldr r0, [r0]
	bl _call_via_r0
	ldrb r1, [r4]
	lsls r0, r1, #2
	adds r0, r0, r5
	ldr r0, [r0]
	cmp r0, #0
	beq _08034F2C
	ldr r0, _08034F3C @ =0x0203A97C
	ldrb r0, [r0, #0xa]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _08034F02
_08034F2C:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08034F34: .4byte 0x08B96F14
_08034F38: .4byte 0x0203A8EC
_08034F3C: .4byte 0x0203A97C
