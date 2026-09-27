	.include "macro.inc"

	.syntax unified

	thumb_func_start DrawSupportScreenUnitSprites
DrawSupportScreenUnitSprites: @ 0x0809B604
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	mov r8, r0
	bl GetSupportScreenUnitCount
	adds r7, r0, #0
	movs r6, #0
	cmp r6, r7
	bge _0809B65E
_0809B61A:
	adds r0, r6, #0
	movs r1, #3
	bl __divsi3
	lsls r0, r0, #4
	mov r2, r8
	ldr r1, [r2, #0x34]
	subs r1, #0x4c
	subs r5, r0, r1
	adds r0, r6, #0
	movs r1, #3
	bl __modsi3
	lsls r0, r0, #6
	adds r4, r0, #0
	adds r4, #0x18
	adds r0, r5, #0
	subs r0, #0x4c
	cmp r0, #0x30
	bhi _0809B658
	adds r0, r6, #0
	bl GetSupportScreenClassIdAt
	str r0, [sp]
	movs r0, #0
	adds r1, r4, #0
	adds r2, r5, #0
	movs r3, #0xc8
	lsls r3, r3, #8
	bl PutUnitSpriteForClassId
_0809B658:
	adds r6, #1
	cmp r6, r7
	blt _0809B61A
_0809B65E:
	bl SyncUnitSpriteSheet
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
