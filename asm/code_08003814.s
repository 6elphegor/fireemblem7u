	.include "macro.inc"

	.syntax unified

	thumb_func_start StartOrChangeBgm
StartOrChangeBgm: @ 0x08003814
	push {r7, lr}
	sub sp, #0xc
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
	ldr r0, _08003838 @ =0x02024E1C
	movs r1, #6
	ldrsb r1, [r0, r1]
	cmp r1, #0
	beq _0800383C
	bl GetCurrentBgmSong
	ldr r1, [r7]
	cmp r0, r1
	bne _0800383C
	b _08003888
	.align 2, 0
_08003838: .4byte 0x02024E1C
_0800383C:
	ldr r1, _08003850 @ =0x0202BBF8
	adds r0, r1, #0
	adds r1, #0x41
	ldrb r0, [r1]
	lsls r1, r0, #0x1f
	lsrs r0, r1, #0x1f
	cmp r0, #0
	beq _08003854
	b _08003888
	.align 2, 0
_08003850: .4byte 0x0202BBF8
_08003854:
	bl sub_0800421C
	ldr r0, _0800387C @ =0x02024E1C
	movs r1, #6
	ldrsb r1, [r0, r1]
	cmp r1, #0
	beq _08003880
	ldr r1, [r7, #4]
	adds r0, r1, #0
	bl FadeBgmOut
	ldr r0, [r7, #4]
	adds r2, r0, #0
	lsls r1, r2, #4
	ldr r2, [r7, #8]
	ldr r0, [r7]
	bl PlaySongDelayed
	b _08003888
	.align 2, 0
_0800387C: .4byte 0x02024E1C
_08003880:
	ldr r1, [r7, #8]
	ldr r0, [r7]
	bl StartBgmCore
_08003888:
	add sp, #0xc
	pop {r7}
	pop {r0}
	bx r0
