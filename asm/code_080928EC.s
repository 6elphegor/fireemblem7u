	.include "macro.inc"

	.syntax unified

	thumb_func_start UpdatePrepItemScreenFace
UpdatePrepItemScreenFace: @ 0x080928EC
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	adds r4, r0, #0
	adds r6, r1, #0
	ldr r0, [sp, #0x20]
	lsls r2, r2, #0x10
	lsrs r7, r2, #0x10
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	mov r8, r3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov sb, r0
	ldr r0, _0809294C @ =0x08CC4448
	bl Proc_Find
	adds r5, r0, #0
	lsls r1, r4, #2
	adds r0, #0x40
	adds r0, r0, r1
	ldr r0, [r0]
	cmp r0, r6
	beq _08092950
	cmp r0, #0
	beq _0809292A
	adds r0, r4, #0
	bl EndFaceById
_0809292A:
	cmp r6, #0
	beq _0809296C
	adds r0, r6, #0
	bl GetUnitPortraitId
	adds r1, r0, #0
	lsls r2, r7, #0x10
	asrs r2, r2, #0x10
	mov r0, r8
	lsls r3, r0, #0x10
	asrs r3, r3, #0x10
	mov r0, sb
	str r0, [sp]
	adds r0, r4, #0
	bl StartBmFace
	b _0809296C
	.align 2, 0
_0809294C: .4byte 0x08CC4448
_08092950:
	cmp r6, #0
	beq _0809296C
	lsls r1, r7, #0x10
	asrs r1, r1, #0x10
	mov r0, r8
	lsls r2, r0, #0x10
	asrs r2, r2, #0x10
	adds r0, r4, #0
	bl SetFacePosition
	adds r0, r4, #0
	mov r1, sb
	bl SetFaceDispById
_0809296C:
	lsls r1, r4, #2
	adds r0, r5, #0
	adds r0, #0x40
	adds r0, r0, r1
	str r6, [r0]
	lsls r1, r4, #1
	adds r0, r5, #0
	adds r0, #0x34
	adds r0, r0, r1
	strh r7, [r0]
	adds r0, r5, #0
	adds r0, #0x38
	adds r0, r0, r1
	mov r2, r8
	strh r2, [r0]
	adds r0, r5, #0
	adds r0, #0x3c
	adds r0, r0, r1
	mov r1, sb
	strh r1, [r0]
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
