	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0807006C
sub_0807006C: @ 0x0807006C
	push {r4, r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x64
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x64
	ldrh r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x64
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x64
	movs r2, #0
	ldrsh r0, [r1, r2]
	cmp r0, #0x63
	ble _080700B8
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x64
	ldrh r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0]
_080700B8:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x64
	movs r0, #0
	ldrsh r2, [r1, r0]
	movs r0, #6
	movs r1, #8
	bl sub_0806FF18
	ldr r1, [r7]
	adds r0, r1, #0
	adds r4, r1, #0
	adds r4, #0x64
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x66
	movs r0, #0
	ldrsh r2, [r1, r0]
	adds r0, r2, #0
	movs r1, #0x64
	bl __modsi3
	adds r1, r0, #0
	movs r2, #0
	ldrsh r0, [r4, r2]
	lsls r2, r1, #0x10
	asrs r1, r2, #0x10
	cmp r0, r1
	bne _08070102
	ldr r0, [r7]
	bl Proc_Break
	movs r1, #0xe5
	lsls r1, r1, #2
	adds r0, r1, #0
	bl m4aSongNumStop
_08070102:
	add sp, #4
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0
