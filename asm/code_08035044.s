	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08035044
sub_08035044: @ 0x08035044
	push {r4, lr}
	movs r4, #0
	ldr r0, _0803507C @ =0x03004690
	ldr r2, [r0]
	ldr r0, [r2, #0xc]
	movs r1, #0x80
	lsls r1, r1, #4
	ands r0, r1
	cmp r0, #0
	beq _08035068
	movs r0, #0x10
	ldrsb r0, [r2, r0]
	movs r1, #0x11
	ldrsb r1, [r2, r1]
	bl GetRiddenBallistaAt
	cmp r0, #0
	bne _0803509A
_08035068:
	ldr r1, _08035080 @ =0x0203A8EC
	adds r1, #0x7b
	movs r0, #4
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _08035084
	bl AiDoBerserkMove
	b _0803509A
	.align 2, 0
_0803507C: .4byte 0x03004690
_08035080: .4byte 0x0203A8EC
_08035084:
	bl AiTryExecScriptB
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	beq _0803509A
	adds r4, #1
	cmp r4, #0xff
	ble _08035084
	bl AiExecFallbackScriptB
_0803509A:
	pop {r4}
	pop {r0}
	bx r0
