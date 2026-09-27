	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0807812C
sub_0807812C: @ 0x0807812C
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	movs r0, #0
	str r0, [r4, #4]
	str r0, [r4, #8]
	ldr r6, _0807813C @ =0x08C9E9A4
	adds r7, r6, #4
	b _0807814E
	.align 2, 0
_0807813C: .4byte 0x08C9E9A4
_08078140:
	lsls r0, r5, #3
	adds r0, r0, r7
	ldr r1, [r0]
	lsls r1, r1, #2
	ldr r0, [r4]
	adds r0, r0, r1
	str r0, [r4]
_0807814E:
	ldr r0, [r4]
	ldrh r5, [r0]
	ldrh r0, [r0, #2]
	bl CheckFlag
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08078140
	lsls r0, r5, #3
	adds r0, r0, r6
	ldr r1, [r0]
	adds r0, r4, #0
	bl _call_via_r1
	cmp r0, #1
	bne _08078140
	ldr r0, [r4, #4]
	cmp r0, #0
	bne _08078178
	movs r0, #0
	b _0807817A
_08078178:
	adds r0, r4, #0
_0807817A:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
