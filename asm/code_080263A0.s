	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080263A0
sub_080263A0: @ 0x080263A0
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	mov sb, r0
	mov r8, r1
	adds r6, r2, #0
	adds r7, r3, #0
	ldr r0, [sp, #0x20]
	bl GetUnitSMSId
	adds r4, r0, #0
	bl UseUnitSprite
	adds r5, r0, #0
	adds r5, #0x80
	mov r1, r8
	adds r1, #0x10
	movs r0, #0x80
	lsls r0, r0, #1
	cmp r1, r0
	bhi _0802646A
	adds r0, r6, #0
	adds r0, #0x20
	cmp r0, #0xc0
	bhi _0802646A
	ldr r1, _080263F0 @ =0x08C99700
	movs r0, #0x7f
	ands r0, r4
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrh r0, [r0, #2]
	cmp r0, #1
	beq _08026420
	cmp r0, #1
	bgt _080263F4
	cmp r0, #0
	beq _080263FA
	b _0802646A
	.align 2, 0
_080263F0: .4byte 0x08C99700
_080263F4:
	cmp r0, #2
	beq _08026448
	b _0802646A
_080263FA:
	ldr r0, [sp, #0x20]
	bl GetUnitSpritePalette
	movs r1, #0xf
	ands r1, r0
	lsls r1, r1, #0xc
	adds r1, r7, r1
	adds r1, r1, r5
	ldr r3, _0802641C @ =0x08B905B8
	str r1, [sp]
	mov r0, sb
	mov r1, r8
	adds r2, r6, #0
	bl PutSprite
	b _0802646A
	.align 2, 0
_0802641C: .4byte 0x08B905B8
_08026420:
	ldr r0, [sp, #0x20]
	bl GetUnitSpritePalette
	movs r1, #0xf
	ands r1, r0
	lsls r1, r1, #0xc
	adds r1, r7, r1
	adds r1, r1, r5
	adds r2, r6, #0
	subs r2, #0x10
	ldr r3, _08026444 @ =0x08B905D8
	str r1, [sp]
	mov r0, sb
	mov r1, r8
	bl PutSprite
	b _0802646A
	.align 2, 0
_08026444: .4byte 0x08B905D8
_08026448:
	ldr r0, [sp, #0x20]
	bl GetUnitSpritePalette
	movs r4, #0xf
	ands r4, r0
	lsls r4, r4, #0xc
	adds r4, r7, r4
	adds r4, r4, r5
	mov r1, r8
	subs r1, #8
	adds r2, r6, #0
	subs r2, #0x10
	ldr r3, _08026478 @ =0x08B905C0
	str r4, [sp]
	mov r0, sb
	bl PutSprite
_0802646A:
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08026478: .4byte 0x08B905C0
