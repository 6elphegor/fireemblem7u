	.include "macro.inc"

	.syntax unified

	thumb_func_start GetBattleAnimType
GetBattleAnimType: @ 0x0802A430
	push {lr}
	ldr r0, _0802A464 @ =0x0202BBF8
	adds r0, #0x42
	ldrb r0, [r0]
	lsls r0, r0, #0x1d
	lsrs r0, r0, #0x1e
	cmp r0, #2
	bne _0802A48A
	ldr r2, _0802A468 @ =0x0203A3F0
	movs r0, #0xb
	ldrsb r0, [r2, r0]
	movs r1, #0xc0
	ands r0, r1
	adds r3, r2, #0
	cmp r0, #0
	bne _0802A470
	ldr r0, _0802A46C @ =0x0203A470
	ldrb r0, [r0, #0xb]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	ands r0, r1
	cmp r0, #0
	bne _0802A484
	adds r0, r3, #0
	b _0802A486
	.align 2, 0
_0802A464: .4byte 0x0202BBF8
_0802A468: .4byte 0x0203A3F0
_0802A46C: .4byte 0x0203A470
_0802A470:
	ldr r2, _0802A480 @ =0x0203A470
	movs r0, #0xb
	ldrsb r0, [r2, r0]
	ands r0, r1
	cmp r0, #0
	beq _0802A484
	movs r0, #1
	b _0802A48A
	.align 2, 0
_0802A480: .4byte 0x0203A470
_0802A484:
	adds r0, r2, #0
_0802A486:
	bl GetUnitSoloBattleAnimType
_0802A48A:
	pop {r1}
	bx r1
	.align 2, 0
