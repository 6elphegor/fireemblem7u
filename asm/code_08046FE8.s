	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08046FE8
sub_08046FE8: @ 0x08046FE8
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	ldr r6, _08047058 @ =0x0203A3F0
	movs r0, #0x13
	ldrsb r0, [r6, r0]
	cmp r0, #0
	bne _08047004
	ldr r0, _0804705C @ =0x08C9D00C
	bl Proc_Find
	adds r4, r0, #0
	bl StartLinkArenaMUDeathFade
	str r4, [r7, #0x54]
_08047004:
	ldr r5, _08047060 @ =0x0203A470
	movs r0, #0x13
	ldrsb r0, [r5, r0]
	cmp r0, #0
	bne _08047050
	bl RefreshUnitSprites
	movs r0, #0xb
	ldrsb r0, [r5, r0]
	bl GetUnit
	bl HideUnitSprite
	adds r0, r5, #0
	bl StartMu
	adds r4, r0, #0
	movs r0, #0x10
	ldrsb r0, [r6, r0]
	movs r1, #0x11
	ldrsb r1, [r6, r1]
	movs r2, #0x10
	ldrsb r2, [r5, r2]
	movs r3, #0x11
	ldrsb r3, [r5, r3]
	bl GetFacingFromTo
	ldr r1, _08047064 @ =0x02033E00
	strb r0, [r1]
	movs r0, #4
	strb r0, [r1, #1]
	adds r0, r4, #0
	bl SetMuMoveScript
	adds r0, r4, #0
	bl StartLinkArenaMUDeathFade
	str r4, [r7, #0x54]
_08047050:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08047058: .4byte 0x0203A3F0
_0804705C: .4byte 0x08C9D00C
_08047060: .4byte 0x0203A470
_08047064: .4byte 0x02033E00
