	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08050844
sub_08050844: @ 0x08050844
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r7, r0, #0
	ldr r0, [r7, #0x44]
	mov r8, r0
	movs r1, #0x2c
	ldrsh r0, [r7, r1]
	lsls r0, r0, #2
	add r0, r8
	ldrh r4, [r0, #2]
	ldr r3, _080508C8 @ =0x02000000
	ldr r6, [r3]
	ldrh r2, [r0]
	mov ip, r2
	movs r5, #0
	ldrsh r2, [r0, r5]
	ldrh r1, [r6, #2]
	adds r0, r1, r2
	movs r5, #0
	mov sb, r5
	strh r0, [r6, #2]
	lsls r1, r4, #0x10
	asrs r1, r1, #0x10
	ldrh r5, [r6, #4]
	adds r0, r5, r1
	strh r0, [r6, #4]
	ldr r6, [r3, #4]
	ldrh r5, [r6, #2]
	adds r0, r5, r2
	strh r0, [r6, #2]
	ldrh r5, [r6, #4]
	adds r0, r5, r1
	strh r0, [r6, #4]
	ldr r6, [r3, #8]
	ldrh r5, [r6, #2]
	adds r0, r5, r2
	strh r0, [r6, #2]
	ldrh r5, [r6, #4]
	adds r0, r5, r1
	strh r0, [r6, #4]
	ldr r6, [r3, #0xc]
	ldrh r0, [r6, #2]
	adds r2, r0, r2
	strh r2, [r6, #2]
	ldrh r2, [r6, #4]
	adds r1, r2, r1
	strh r1, [r6, #4]
	ldr r0, _080508CC @ =0x03002870
	ldrh r1, [r0, #0x26]
	mov r2, ip
	subs r5, r1, r2
	strh r5, [r0, #0x26]
	ldrh r5, [r0, #0x24]
	subs r4, r5, r4
	strh r4, [r0, #0x24]
	bl sub_08050808
	cmp r0, #0
	bne _080508D0
	adds r0, r7, #0
	bl Proc_Break
	b _08050906
	.align 2, 0
_080508C8: .4byte 0x02000000
_080508CC: .4byte 0x03002870
_080508D0:
	bl sub_08050808
	cmp r0, #2
	bne _080508EC
	ldr r0, _080508E8 @ =0x081D7FB6
	str r0, [r7, #0x44]
	mov r0, sb
	strh r0, [r7, #0x2c]
	movs r0, #3
	bl sub_08050814
	b _08050906
	.align 2, 0
_080508E8: .4byte 0x081D7FB6
_080508EC:
	ldrh r0, [r7, #0x2c]
	adds r0, #1
	strh r0, [r7, #0x2c]
	movs r1, #0x2c
	ldrsh r0, [r7, r1]
	lsls r0, r0, #2
	add r0, r8
	ldr r1, _08050914 @ =0x00007FFF
	ldrh r0, [r0]
	cmp r0, r1
	bne _08050906
	mov r2, sb
	strh r2, [r7, #0x2c]
_08050906:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08050914: .4byte 0x00007FFF
