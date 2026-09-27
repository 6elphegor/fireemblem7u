	.include "macro.inc"

	.syntax unified

	thumb_func_start PutSysArrow
PutSysArrow: @ 0x08015AA8
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r5, r0, #0
	adds r6, r1, #0
	lsls r4, r2, #0x18
	lsrs r4, r4, #0x18
	bl GetGameTime
	lsrs r0, r0, #3
	movs r1, #3
	bl __umodsi3
	cmp r4, #0
	beq _08015ACC
	ldr r1, _08015AC8 @ =0x08B92E2C
	b _08015ACE
	.align 2, 0
_08015AC8: .4byte 0x08B92E2C
_08015ACC:
	ldr r1, _08015AEC @ =0x08B92E20
_08015ACE:
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r3, [r0]
	movs r0, #0
	str r0, [sp]
	movs r0, #4
	adds r1, r5, #0
	adds r2, r6, #0
	bl PutSprite
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08015AEC: .4byte 0x08B92E20
