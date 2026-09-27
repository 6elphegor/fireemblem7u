	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080AECB0
sub_080AECB0: @ 0x080AECB0
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	adds r4, r2, #0
	adds r1, r3, #0
	ldr r0, _080AECDC @ =0x08CE5E14
	bl Proc_StartBlocking
	adds r1, r0, #0
	adds r0, #0x64
	movs r2, #0
	strh r5, [r0]
	str r4, [r1, #0x58]
	subs r0, #0x16
	strh r2, [r0]
	cmp r6, #1
	beq _080AECEC
	cmp r6, #1
	bgt _080AECE0
	cmp r6, #0
	beq _080AECE6
	b _080AECFC
	.align 2, 0
_080AECDC: .4byte 0x08CE5E14
_080AECE0:
	cmp r6, #2
	beq _080AECF4
	b _080AECFC
_080AECE6:
	movs r0, #0x80
	str r0, [r1, #0x5c]
	b _080AECFA
_080AECEC:
	str r2, [r1, #0x5c]
	movs r0, #0x80
	lsls r0, r0, #2
	b _080AECFA
_080AECF4:
	str r2, [r1, #0x5c]
	movs r0, #0x80
	lsls r0, r0, #3
_080AECFA:
	str r0, [r1, #0x60]
_080AECFC:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
