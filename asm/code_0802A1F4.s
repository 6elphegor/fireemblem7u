	.include "macro.inc"

	.syntax unified

	thumb_func_start BattleInitTargetCanCounter
BattleInitTargetCanCounter: @ 0x0802A1F4
	push {r4, lr}
	ldr r4, _0802A24C @ =0x0203A3F0
	ldr r3, _0802A250 @ =0x0203A470
	ldr r0, [r4, #0x4c]
	ldr r1, [r3, #0x4c]
	orrs r0, r1
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0802A216
	adds r0, r3, #0
	adds r0, #0x48
	movs r2, #0
	movs r1, #0
	strh r1, [r0]
	adds r0, #0xa
	strb r2, [r0]
_0802A216:
	adds r1, r4, #0
	adds r1, #0x30
	movs r0, #0xf
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #4
	bne _0802A246
	movs r0, #0xb
	ldrsb r0, [r4, r0]
	movs r1, #0xc0
	ands r0, r1
	cmp r0, #0
	bne _0802A246
	movs r2, #0xb
	ldrsb r2, [r3, r2]
	ands r2, r1
	cmp r2, #0
	bne _0802A246
	adds r0, r3, #0
	adds r0, #0x48
	movs r1, #0
	strh r2, [r0]
	adds r0, #0xa
	strb r1, [r0]
_0802A246:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802A24C: .4byte 0x0203A3F0
_0802A250: .4byte 0x0203A470
