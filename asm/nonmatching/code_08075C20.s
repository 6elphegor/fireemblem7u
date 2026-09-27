	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08075C20
sub_08075C20: @ 0x08075C20
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, _08075C88 @ =0x0203E0FC
	ldr r1, _08075C8C @ =0x0203A470
	adds r2, r1, #0
	adds r1, #0x73
	adds r2, r0, #0
	adds r0, #0x60
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	ldrb r1, [r1]
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	ldr r0, _08075C88 @ =0x0203E0FC
	ldr r1, _08075C8C @ =0x0203A470
	adds r2, r1, #0
	adds r1, #0x74
	adds r2, r0, #0
	adds r0, #0x61
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	ldrb r1, [r1]
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	ldr r1, _08075C88 @ =0x0203E0FC
	adds r0, r1, #0
	adds r2, r1, #0
	adds r2, #0x60
	ldrb r1, [r2]
	ldr r2, _08075C88 @ =0x0203E0FC
	adds r0, r2, #0
	adds r3, r2, #0
	adds r3, #0x61
	ldrb r2, [r3]
	ldr r0, [r7]
	bl EnsureCameraOntoPosition
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08075C88: .4byte 0x0203E0FC
_08075C8C: .4byte 0x0203A470
