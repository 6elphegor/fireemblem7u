	.include "macro.inc"

	.syntax unified

	thumb_func_start GetWeaponExpProgressState
GetWeaponExpProgressState: @ 0x08016A38
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	adds r6, r2, #0
	bl GetWeaponLevelFromExp
	cmp r0, #6
	bhi _08016AAA
	lsls r0, r0, #2
	ldr r1, _08016A54 @ =_08016A58
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08016A54: .4byte _08016A58
_08016A58: @ jump table
	.4byte _08016AA4 @ case 0
	.4byte _08016A74 @ case 1
	.4byte _08016A7C @ case 2
	.4byte _08016A86 @ case 3
	.4byte _08016A90 @ case 4
	.4byte _08016A9A @ case 5
	.4byte _08016AA4 @ case 6
_08016A74:
	subs r0, r5, #1
	str r0, [r4]
	movs r0, #0x1e
	b _08016AA8
_08016A7C:
	adds r0, r5, #0
	subs r0, #0x1f
	str r0, [r4]
	movs r0, #0x28
	b _08016AA8
_08016A86:
	adds r0, r5, #0
	subs r0, #0x47
	str r0, [r4]
	movs r0, #0x32
	b _08016AA8
_08016A90:
	adds r0, r5, #0
	subs r0, #0x79
	str r0, [r4]
	movs r0, #0x3c
	b _08016AA8
_08016A9A:
	adds r0, r5, #0
	subs r0, #0xb5
	str r0, [r4]
	movs r0, #0x46
	b _08016AA8
_08016AA4:
	movs r0, #0
	str r0, [r4]
_08016AA8:
	str r0, [r6]
_08016AAA:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
