	.include "macro.inc"

	.syntax unified

	thumb_func_start DrawUiItemHover
DrawUiItemHover: @ 0x0804A064
	push {r4, r5, r6, lr}
	adds r3, r0, #0
	adds r4, r1, #0
	adds r2, r3, r2
	subs r5, r2, #1
	adds r4, #1
	ldr r2, _0804A0B8 @ =0x02023460
	lsls r0, r4, #5
	adds r0, r0, r3
	lsls r0, r0, #1
	adds r0, r0, r2
	ldr r1, _0804A0BC @ =0x0000106A
	strh r1, [r0]
	adds r3, #1
	adds r6, r2, #0
	cmp r3, r5
	bge _0804A09E
	ldr r2, _0804A0C0 @ =0x00001076
	lsls r1, r3, #1
	lsls r0, r4, #6
	adds r0, r0, r6
	adds r1, r1, r0
	subs r3, r5, r3
_0804A092:
	strh r2, [r1]
	adds r1, #2
	subs r3, #1
	cmp r3, #0
	bne _0804A092
	adds r3, r5, #0
_0804A09E:
	lsls r0, r4, #5
	adds r0, r0, r3
	lsls r0, r0, #1
	adds r0, r0, r6
	ldr r1, _0804A0C4 @ =0x0000106B
	strh r1, [r0]
	movs r0, #2
	bl EnableBgSync
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0804A0B8: .4byte 0x02023460
_0804A0BC: .4byte 0x0000106A
_0804A0C0: .4byte 0x00001076
_0804A0C4: .4byte 0x0000106B
