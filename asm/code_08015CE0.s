	.include "macro.inc"

	.syntax unified

	thumb_func_start EnsureCameraOntoPosition
EnsureCameraOntoPosition: @ 0x08015CE0
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r5, r0, #0
	mov r8, r1
	mov sb, r2
	lsls r0, r1, #4
	bl GetCameraAdjustedX
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	mov r1, sb
	lsls r0, r1, #4
	bl GetCameraAdjustedY
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	ldr r1, _08015D28 @ =0x0202BBB8
	movs r2, #0xc
	ldrsh r0, [r1, r2]
	cmp r7, r0
	bne _08015D16
	movs r2, #0xe
	ldrsh r0, [r1, r2]
	cmp r6, r0
	beq _08015D22
_08015D16:
	ldr r4, _08015D2C @ =0x08B92E38
	adds r0, r4, #0
	bl Proc_Find
	cmp r0, #0
	beq _08015D30
_08015D22:
	movs r0, #0
	b _08015D60
	.align 2, 0
_08015D28: .4byte 0x0202BBB8
_08015D2C: .4byte 0x08B92E38
_08015D30:
	cmp r5, #0
	beq _08015D3E
	adds r0, r4, #0
	adds r1, r5, #0
	bl Proc_StartBlocking
	b _08015D46
_08015D3E:
	adds r0, r4, #0
	movs r1, #3
	bl Proc_Start
_08015D46:
	adds r2, r0, #0
	ldr r0, _08015D6C @ =0x0202BBB8
	ldrh r1, [r0, #0xc]
	strh r1, [r2, #0x30]
	ldrh r0, [r0, #0xe]
	strh r0, [r2, #0x32]
	strh r7, [r2, #0x2c]
	strh r6, [r2, #0x2e]
	mov r0, r8
	strh r0, [r2, #0x34]
	mov r1, sb
	strh r1, [r2, #0x36]
	movs r0, #1
_08015D60:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08015D6C: .4byte 0x0202BBB8
