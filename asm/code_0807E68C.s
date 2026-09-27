	.include "macro.inc"

	.syntax unified

	thumb_func_start PutFireDragonSpritefx
PutFireDragonSpritefx: @ 0x0807E68C
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #0x10
	adds r6, r0, #0
	mov r8, r1
	adds r7, r2, #0
	mov sb, r3
	ldr r5, [sp, #0x2c]
	ldr r0, _0807E71C @ =0x083FC994
	ldr r1, [r0, #4]
	ldr r0, [r0]
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	ldr r0, _0807E720 @ =0x08CBFC74
	bl Proc_Find
	adds r4, r0, #0
	cmp r4, #0
	beq _0807E786
	adds r0, #0x62
	adds r0, r0, r6
	mov r1, r8
	strb r1, [r0]
	lsls r0, r5, #1
	mov r2, r8
	adds r5, r0, r2
	lsls r1, r6, #2
	adds r0, r4, #0
	adds r0, #0x2c
	adds r0, r0, r1
	mov r8, r0
	ldr r0, [r0]
	cmp r0, #0
	bne _0807E728
	adds r0, r4, #0
	adds r0, #0x6a
	ldrb r0, [r0]
	lsls r0, r0, #2
	add r0, sp
	adds r0, #8
	ldr r0, [r0]
	ldr r3, _0807E724 @ =0x0000A980
	str r5, [sp]
	movs r1, #0xd
	str r1, [sp, #4]
	adds r1, r7, #0
	mov r2, sb
	bl StartSpriteAnimProc
	mov r3, r8
	str r0, [r3]
	lsls r2, r6, #1
	adds r1, r4, #0
	adds r1, #0x38
	adds r1, r1, r2
	adds r0, r4, #0
	adds r0, #0x44
	adds r0, r0, r2
	strh r7, [r0]
	strh r7, [r1]
	adds r1, r4, #0
	adds r1, #0x3e
	adds r1, r1, r2
	adds r0, r4, #0
	adds r0, #0x4a
	adds r0, r0, r2
	mov r2, sb
	strh r2, [r0]
	strh r2, [r1]
	b _0807E786
	.align 2, 0
_0807E71C: .4byte 0x083FC994
_0807E720: .4byte 0x08CBFC74
_0807E724: .4byte 0x0000A980
_0807E728:
	ldr r3, [sp, #0x30]
	cmp r3, #0
	bne _0807E738
	ldr r0, [r0, #0x50]
	adds r1, r5, #0
	bl SetSpriteAnimId
	b _0807E786
_0807E738:
	ldr r0, [r0, #0x50]
	adds r1, r5, #0
	bl SetSpriteAnimId
	lsls r2, r6, #1
	adds r0, r4, #0
	adds r0, #0x38
	adds r0, r0, r2
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, r7
	bne _0807E75E
	adds r0, r4, #0
	adds r0, #0x3e
	adds r0, r0, r2
	movs r3, #0
	ldrsh r0, [r0, r3]
	cmp r0, sb
	beq _0807E786
_0807E75E:
	adds r0, r4, #0
	adds r0, #0x56
	adds r0, r0, r2
	movs r1, #0
	strh r1, [r0]
	adds r0, r4, #0
	adds r0, #0x50
	adds r0, r0, r2
	mov r1, sp
	ldrh r1, [r1, #0x30]
	strh r1, [r0]
	adds r0, r4, #0
	adds r0, #0x44
	adds r0, r0, r2
	strh r7, [r0]
	adds r0, r4, #0
	adds r0, #0x4a
	adds r0, r0, r2
	mov r2, sb
	strh r2, [r0]
_0807E786:
	add sp, #0x10
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
