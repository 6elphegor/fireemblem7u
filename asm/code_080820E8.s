	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080820E8
sub_080820E8: @ 0x080820E8
	push {lr}
	sub sp, #0x20
	adds r2, r0, #0
	ldrb r1, [r2]
	adds r0, r1, #0
	subs r0, #0x41
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x19
	bhi _08082102
	adds r0, r1, #0
	subs r0, #0x41
	b _08082162
_08082102:
	adds r0, r1, #0
	subs r0, #0x61
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x19
	bhi _08082114
	ldrb r0, [r2]
	subs r0, #0x47
	b _08082162
_08082114:
	adds r0, r1, #0
	subs r0, #0x30
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #9
	bhi _08082126
	ldrb r0, [r2]
	adds r0, #4
	b _08082162
_08082126:
	adds r0, r1, #0
	cmp r0, #0x2d
	bne _08082130
	movs r0, #0x3e
	b _08082162
_08082130:
	cmp r0, #0x27
	bne _08082138
	movs r0, #0x3f
	b _08082162
_08082138:
	cmp r0, #0x3a
	bne _08082140
	movs r0, #0x40
	b _08082162
_08082140:
	cmp r0, #0x2e
	bne _08082148
	movs r0, #0x41
	b _08082162
_08082148:
	cmp r0, #0x20
	beq _08082160
	ldr r1, _0808215C @ =0x08404BA0
	ldrb r2, [r2]
	mov r0, sp
	bl sub_080C0088
	movs r0, #1
	rsbs r0, r0, #0
	b _08082162
	.align 2, 0
_0808215C: .4byte 0x08404BA0
_08082160:
	movs r0, #0x80
_08082162:
	add sp, #0x20
	pop {r1}
	bx r1
