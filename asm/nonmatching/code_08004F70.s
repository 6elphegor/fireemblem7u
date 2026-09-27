	.include "macro.inc"

	.syntax unified

	thumb_func_start DebugPutStr
DebugPutStr: @ 0x08004F70
	push {r4, r5, r6, r7, lr}
	adds r2, r0, #0
	ldrb r0, [r1]
	ldr r5, _08004F90 @ =0x02026D30
	cmp r0, #0
	beq _08004FAE
	adds r3, r5, #0
	ldr r4, _08004F94 @ =0x0000FFC0
_08004F80:
	cmp r0, #0x60
	bls _08004F98
	ldrh r6, [r3, #6]
	adds r0, r6, r4
	ldrb r7, [r1]
	adds r0, r7, r0
	b _08004FA2
	.align 2, 0
_08004F90: .4byte 0x02026D30
_08004F94: .4byte 0x0000FFC0
_08004F98:
	ldrh r6, [r3, #6]
	ldr r7, _08004FBC @ =0x0000FFE0
	adds r0, r6, r7
	ldrb r6, [r1]
	adds r0, r6, r0
_08004FA2:
	strh r0, [r2]
	adds r2, #2
	adds r1, #1
	ldrb r0, [r1]
	cmp r0, #0
	bne _08004F80
_08004FAE:
	movs r7, #4
	ldrsh r0, [r5, r7]
	bl EnableBgSyncById
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08004FBC: .4byte 0x0000FFE0
