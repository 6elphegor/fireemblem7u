	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08079954
sub_08079954: @ 0x08079954
	push {r4, lr}
	adds r2, r0, #0
	ldr r1, _0807997C @ =0x08CA0448
	ldrb r0, [r1]
	cmp r0, #0
	beq _08079988
	ldr r0, [r2]
	ldrb r3, [r0, #4]
	movs r4, #0x80
	lsls r4, r4, #9
_08079968:
	ldrb r0, [r1, #1]
	cmp r3, r0
	bne _08079980
	ldr r0, [r2, #0xc]
	ands r0, r4
	cmp r0, #0
	beq _08079980
	movs r0, #1
	b _0807998A
	.align 2, 0
_0807997C: .4byte 0x08CA0448
_08079980:
	adds r1, #8
	ldrb r0, [r1]
	cmp r0, #0
	bne _08079968
_08079988:
	movs r0, #0
_0807998A:
	pop {r4}
	pop {r1}
	bx r1
