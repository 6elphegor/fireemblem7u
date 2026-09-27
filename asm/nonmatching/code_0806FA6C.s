	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0806FA6C
sub_0806FA6C: @ 0x0806FA6C
	push {r4, r5, r7, lr}
	sub sp, #0xc
	add r7, sp, #4
	str r0, [r7]
	str r1, [r7, #4]
	ldr r0, _0806FB3C @ =0x0203E0FC
	ldr r1, [r7, #4]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, r0, r1
	ldrb r1, [r0, #0x11]
	adds r0, r1, #2
	lsls r1, r0, #5
	adds r0, r1, #2
	ldr r1, _0806FB3C @ =0x0203E0FC
	ldr r2, [r7, #4]
	adds r4, r2, #0
	lsls r3, r4, #2
	adds r3, r3, r2
	lsls r2, r3, #2
	adds r1, r1, r2
	ldrb r2, [r1, #0x10]
	adds r0, r0, r2
	adds r1, r0, #0
	lsls r0, r1, #1
	ldr r1, _0806FB40 @ =0x02022C60
	adds r0, r0, r1
	ldr r1, _0806FB3C @ =0x0203E0FC
	ldr r2, [r7, #4]
	adds r4, r2, #0
	lsls r3, r4, #2
	adds r3, r3, r2
	lsls r2, r3, #2
	adds r1, r1, r2
	ldrh r2, [r1, #0xe]
	lsrs r1, r2, #4
	adds r3, r1, #0
	lsls r2, r3, #0x10
	lsrs r1, r2, #0x10
	ldr r2, _0806FB44 @ =0x00005020
	movs r3, #0
	str r3, [sp]
	movs r3, #3
	bl PutManimWindowNumber
	ldr r0, _0806FB3C @ =0x0203E0FC
	ldr r1, [r7, #4]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, r0, r1
	ldrb r1, [r0, #0x11]
	adds r0, r1, #2
	lsls r1, r0, #5
	adds r0, r1, #3
	ldr r1, _0806FB3C @ =0x0203E0FC
	ldr r2, [r7, #4]
	adds r4, r2, #0
	lsls r3, r4, #2
	adds r3, r3, r2
	lsls r2, r3, #2
	adds r1, r1, r2
	ldrb r2, [r1, #0x10]
	adds r0, r0, r2
	adds r1, r0, #0
	lsls r0, r1, #1
	ldr r1, _0806FB40 @ =0x02022C60
	adds r0, r0, r1
	ldr r1, _0806FB3C @ =0x0203E0FC
	ldr r2, [r7, #4]
	adds r4, r2, #0
	lsls r3, r4, #2
	adds r3, r3, r2
	lsls r2, r3, #2
	adds r3, r1, r2
	ldrb r1, [r3, #0xc]
	ldr r2, _0806FB3C @ =0x0203E0FC
	ldr r3, [r7, #4]
	adds r5, r3, #0
	lsls r4, r5, #2
	adds r4, r4, r3
	lsls r3, r4, #2
	adds r2, r2, r3
	ldrh r3, [r2, #0xe]
	lsrs r2, r3, #4
	adds r4, r2, #0
	lsls r3, r4, #0x10
	lsrs r2, r3, #0x10
	ldr r3, _0806FB48 @ =0x08C9D774
	str r3, [sp]
	movs r3, #0
	bl PutManimWindowBar
	movs r0, #1
	bl EnableBgSync
	add sp, #0xc
	pop {r4, r5, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806FB3C: .4byte 0x0203E0FC
_0806FB40: .4byte 0x02022C60
_0806FB44: .4byte 0x00005020
_0806FB48: .4byte 0x08C9D774
