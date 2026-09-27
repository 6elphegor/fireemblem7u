	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080739B0
sub_080739B0: @ 0x080739B0
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #0x18
	add r7, sp, #0x10
	str r0, [r7]
	ldr r0, _08073A44 @ =0x02023C60
	ldr r1, [r7]
	ldr r2, [r1, #0x30]
	adds r1, r2, #0
	cmp r1, #0
	bge _080739CC
	adds r1, #7
_080739CC:
	asrs r2, r1, #3
	subs r1, r2, #2
	ldr r2, [r7]
	ldr r3, [r2, #0x34]
	adds r2, r3, #0
	cmp r2, #0
	bge _080739DC
	adds r2, #7
_080739DC:
	asrs r3, r2, #3
	adds r2, r3, #0
	subs r2, #8
	ldr r3, _08073A48 @ =0x00004140
	movs r4, #4
	str r4, [sp]
	movs r4, #0xa
	str r4, [sp, #4]
	ldr r4, _08073A4C @ =0x083F9DE0
	str r4, [sp, #8]
	ldr r4, _08073A50 @ =0x083FC5D4
	str r4, [r7, #4]
	ldr r5, [r7]
	adds r6, r5, #0
	adds r5, #0x48
	ldrh r6, [r5]
	adds r4, r6, #1
	mov r8, r4
	mov sb, r8
	mov r4, sb
	strh r4, [r5]
	lsls r6, r6, #0x10
	asrs r5, r6, #0x10
	ldr r6, [r7, #4]
	adds r4, r6, r5
	ldrb r5, [r4]
	str r5, [sp, #0xc]
	bl sub_080149A8
	movs r0, #4
	bl EnableBgSync
	ldr r0, _08073A50 @ =0x083FC5D4
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x48
	movs r3, #0
	ldrsh r1, [r2, r3]
	adds r0, r0, r1
	ldrb r1, [r0]
	cmp r1, #0xff
	bne _08073A36
	ldr r0, [r7]
	bl Proc_Break
_08073A36:
	add sp, #0x18
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08073A44: .4byte 0x02023C60
_08073A48: .4byte 0x00004140
_08073A4C: .4byte 0x083F9DE0
_08073A50: .4byte 0x083FC5D4
