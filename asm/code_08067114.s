	.include "macro.inc"

	.syntax unified

	thumb_func_start EfxSplitColor
EfxSplitColor: @ 0x08067114
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	adds r3, r1, #0
	adds r6, r2, #0
	movs r5, #0
	cmp r5, r6
	bhs _0806714C
	movs r7, #0x1f
	movs r0, #0x1f
	mov ip, r0
_08067128:
	ldrh r0, [r4]
	adds r4, #2
	adds r1, r0, #0
	mov r2, ip
	ands r1, r2
	lsrs r2, r0, #5
	ands r2, r7
	lsrs r0, r0, #0xa
	ands r0, r7
	strb r1, [r3]
	adds r3, #1
	strb r2, [r3]
	adds r3, #1
	strb r0, [r3]
	adds r3, #1
	adds r5, #1
	cmp r5, r6
	blo _08067128
_0806714C:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
