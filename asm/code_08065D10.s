	.include "macro.inc"

	.syntax unified

	thumb_func_start EkrDragonBg3HfScrollHandler_Loop
EkrDragonBg3HfScrollHandler_Loop: @ 0x08065D10
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r1, r0, #0
	ldr r0, _08065D8C @ =0x0201FDAC
	ldr r0, [r0]
	ldr r2, _08065D90 @ =0x0201FDB8
	cmp r0, #0
	bne _08065D28
	ldr r2, _08065D94 @ =0x0201FEF8
_08065D28:
	ldr r0, [r1, #0x50]
	ldrh r3, [r1, #0x2e]
	adds r0, r3, r0
	strh r0, [r1, #0x2e]
	movs r4, #0
	movs r3, #0
	ldr r6, [r1, #0x44]
	mov r8, r6
	ldr r7, [r1, #0x48]
	mov sl, r7
	ldr r0, _08065D98 @ =0x08BDACBC
	mov ip, r0
	ldr r5, [r1, #0x4c]
	ldr r6, _08065D9C @ =0x03002870
	mov sb, r6
_08065D46:
	add r4, sl
	lsrs r0, r4, #8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x17
	add r0, ip
	movs r7, #0
	ldrsh r0, [r0, r7]
	muls r0, r5, r0
	asrs r0, r0, #8
	adds r0, #4
	mov r6, sb
	ldrh r6, [r6, #0x28]
	adds r0, r6, r0
	strh r0, [r2]
	adds r2, #2
	adds r3, #1
	cmp r3, #0x77
	bls _08065D46
	ldrh r0, [r1, #0x2c]
	adds r0, #1
	strh r0, [r1, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, r8
	bne _08065D7E
	adds r0, r1, #0
	bl Proc_End
_08065D7E:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08065D8C: .4byte 0x0201FDAC
_08065D90: .4byte 0x0201FDB8
_08065D94: .4byte 0x0201FEF8
_08065D98: .4byte 0x08BDACBC
_08065D9C: .4byte 0x03002870
