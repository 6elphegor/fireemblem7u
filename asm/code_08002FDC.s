	.include "macro.inc"

	.syntax unified

	thumb_func_start ClearMoveList
ClearMoveList: @ 0x08002FDC
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	ldr r0, _08002FFC @ =0x02024C94
	movs r1, #0
	str r1, [r0]
	ldr r0, _08002FFC @ =0x02024C94
	movs r1, #0
	str r1, [r0, #4]
	movs r0, #0
	str r0, [r7]
_08002FF2:
	ldr r0, [r7]
	cmp r0, #0x1f
	ble _08003000
	b _08003064
	.align 2, 0
_08002FFC: .4byte 0x02024C94
_08003000:
	ldr r0, _08003060 @ =0x02024C9C
	ldr r1, [r7]
	adds r3, r1, #0
	lsls r2, r3, #1
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, r0, r1
	movs r1, #0
	str r1, [r0]
	ldr r0, _08003060 @ =0x02024C9C
	ldr r1, [r7]
	adds r3, r1, #0
	lsls r2, r3, #1
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, #4
	adds r1, r0, r1
	movs r0, #0
	str r0, [r1]
	ldr r0, _08003060 @ =0x02024C9C
	ldr r1, [r7]
	adds r3, r1, #0
	lsls r2, r3, #1
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, r0, r1
	ldrh r1, [r0, #8]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0, #8]
	ldr r0, _08003060 @ =0x02024C9C
	ldr r1, [r7]
	adds r3, r1, #0
	lsls r2, r3, #1
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, r0, r1
	ldrh r1, [r0, #0xa]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0, #0xa]
	ldr r0, [r7]
	adds r1, r0, #1
	str r1, [r7]
	b _08002FF2
	.align 2, 0
_08003060: .4byte 0x02024C9C
_08003064:
	ldr r0, _08003074 @ =0x02024C9C
	movs r1, #0
	str r1, [r0]
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08003074: .4byte 0x02024C9C
