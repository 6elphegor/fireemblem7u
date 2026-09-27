	.include "macro.inc"

	.syntax unified

	thumb_func_start StartAdjustedMenu
StartAdjustedMenu: @ 0x0804A224
	push {r4, lr}
	adds r4, r0, #0
	adds r0, r2, #0
	ldr r2, [r4]
	cmp r1, #0x77
	bgt _0804A234
	lsls r0, r3, #0x18
	b _0804A236
_0804A234:
	lsls r0, r0, #0x18
_0804A236:
	lsrs r0, r0, #0x18
	ldr r1, _0804A250 @ =0xFFFFFF00
	ands r2, r1
	orrs r2, r0
	adds r0, r4, #0
	adds r1, r2, #0
	movs r2, #0
	bl StartLockingMenuExt
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0804A250: .4byte 0xFFFFFF00
