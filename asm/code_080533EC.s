	.include "macro.inc"

	.syntax unified

	thumb_func_start EkrCheckAttackRound
EkrCheckAttackRound: @ 0x080533EC
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r2, #0x13
	bgt _08053424
	ldr r1, _08053418 @ =0x0203E036
	lsls r0, r2, #1
	adds r0, r0, r1
_080533FA:
	movs r3, #0
	ldrsh r1, [r0, r3]
	cmp r1, #0
	beq _08053412
	cmp r1, #1
	beq _08053412
	cmp r1, #2
	beq _08053412
	cmp r1, #3
	beq _08053412
	cmp r1, #9
	bne _0805341C
_08053412:
	movs r0, #1
	b _08053426
	.align 2, 0
_08053418: .4byte 0x0203E036
_0805341C:
	adds r0, #4
	adds r2, #2
	cmp r2, #0x13
	ble _080533FA
_08053424:
	movs r0, #0
_08053426:
	bx lr
