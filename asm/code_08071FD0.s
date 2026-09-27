	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08071FD0
sub_08071FD0: @ 0x08071FD0
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0x14
	add r7, sp, #0x10
	str r0, [r7]
	ldr r0, _08072088 @ =0x02023C60
	ldr r1, [r7]
	ldr r2, [r1, #0x30]
	adds r1, r2, #0
	cmp r1, #0
	bge _08071FEA
	adds r1, #7
_08071FEA:
	asrs r2, r1, #3
	subs r1, r2, #3
	ldr r2, [r7]
	ldr r3, [r2, #0x34]
	adds r2, r3, #0
	cmp r2, #0
	bge _08071FFA
	adds r2, #7
_08071FFA:
	asrs r3, r2, #3
	subs r2, r3, #3
	ldr r3, _0807208C @ =0x00004140
	movs r4, #6
	str r4, [sp]
	movs r4, #6
	str r4, [sp, #4]
	ldr r4, _08072090 @ =0x083F5CF4
	str r4, [sp, #8]
	ldr r4, _08072094 @ =0x08C9DAAC
	ldr r6, [r7]
	adds r5, r6, #0
	adds r6, #0x40
	ldrh r5, [r6]
	mov r8, r5
	mov r6, r8
	lsrs r5, r6, #1
	mov r8, r5
	mov r5, r8
	lsls r6, r5, #0x10
	lsrs r5, r6, #0x10
	adds r4, r4, r5
	ldrb r5, [r4]
	str r5, [sp, #0xc]
	bl sub_080148FC
	movs r0, #4
	bl EnableBgSync
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x40
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x40
	ldrh r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x40
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
	ldr r0, _08072094 @ =0x08C9DAAC
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x40
	ldrh r3, [r2]
	lsrs r1, r3, #1
	adds r3, r1, #0
	lsls r2, r3, #0x10
	lsrs r1, r2, #0x10
	adds r0, r0, r1
	ldrb r1, [r0]
	cmp r1, #0xff
	bne _0807207A
	ldr r0, [r7]
	bl Proc_Break
_0807207A:
	add sp, #0x14
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08072088: .4byte 0x02023C60
_0807208C: .4byte 0x00004140
_08072090: .4byte 0x083F5CF4
_08072094: .4byte 0x08C9DAAC
