	.include "macro.inc"

	.syntax unified

	thumb_func_start UnitRemoveInvalidItems
UnitRemoveInvalidItems: @ 0x08017688
	push {r4, r5, r6, lr}
	sub sp, #0xc
	mov r2, sp
	movs r3, #0
	adds r5, r0, #0
	adds r5, #0x1e
	adds r4, r5, #0
	movs r6, #0
_08017698:
	lsls r0, r3, #1
	adds r1, r4, r0
	ldrh r0, [r1]
	cmp r0, #0
	beq _080176A6
	strh r0, [r2]
	adds r2, #2
_080176A6:
	strh r6, [r1]
	adds r0, r3, #1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r3, #4
	bls _08017698
	movs r0, #0
	strh r0, [r2]
	movs r3, #0
	adds r4, r5, #0
_080176BA:
	lsls r2, r3, #1
	mov r1, sp
	adds r0, r1, r2
	ldrh r1, [r0]
	cmp r1, #0
	beq _080176D4
	adds r0, r4, r2
	strh r1, [r0]
	adds r0, r3, #1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r3, #4
	bls _080176BA
_080176D4:
	add sp, #0xc
	pop {r4, r5, r6}
	pop {r0}
	bx r0
