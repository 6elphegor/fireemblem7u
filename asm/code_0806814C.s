	.include "macro.inc"

	.syntax unified

	thumb_func_start GetProperAnimSoundLocation
GetProperAnimSoundLocation: @ 0x0806814C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	ldr r2, [r0, #0x3c]
	ldr r3, [r2]
	ldr r1, _0806817C @ =0xFFFF0000
	adds r0, r3, #0
	ands r0, r1
	cmp r0, r1
	bne _08068170
	ldr r7, _08068180 @ =0x0000FFFF
	ands r7, r3
	cmp r7, #0
	beq _08068170
_08068168:
	subs r7, #1
	adds r2, #0xc
	cmp r7, #0
	bne _08068168
_08068170:
	adds r6, r2, #0
	movs r7, #0
	movs r0, #0
	mov r8, r0
	b _080681B8
	.align 2, 0
_0806817C: .4byte 0xFFFF0000
_08068180: .4byte 0x0000FFFF
_08068184:
	movs r0, #6
	ldrsh r5, [r6, r0]
	ldr r0, [r6]
	bl GetAnimSpriteRotScaleX
	lsls r0, r0, #0x10
	asrs r0, r0, #0x11
	adds r5, r5, r0
	ldr r0, [r6]
	bl GetAnimSpriteRotScaleX
	adds r4, r0, #0
	ldr r0, [r6]
	bl GetAnimSpriteRotScaleY
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	adds r1, r4, #0
	muls r1, r0, r1
	adds r0, r1, #0
	muls r0, r5, r0
	add r8, r0
	adds r7, r7, r1
	adds r6, #0xc
_080681B8:
	ldr r0, [r6]
	cmp r0, #1
	bne _08068184
	cmp r7, #0
	bne _080681CC
	ldr r0, _080681C8 @ =0x7FFFFFFF
	b _080681D4
	.align 2, 0
_080681C8: .4byte 0x7FFFFFFF
_080681CC:
	mov r0, r8
	adds r1, r7, #0
	bl Div
_080681D4:
	mov r8, r0
	mov r0, r8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
